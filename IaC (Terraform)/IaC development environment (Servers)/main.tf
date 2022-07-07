module "networking" {   #Network VPC module
    source = "./src/modules/network"

    project_id = "medellin-med"
    network_name = "medellin-med-endabank-vpc"
    auto_create_subnetworks = false
    delete_default_routes_on_create = false
    description = "VPC for Endabank bech project"
    
}

module "management-subnet" {    #Managment subtets module to public instances, in that case for the CI/CD Jumpbox host instance
    source = "./src/modules/subnet"

    project_id = "medellin-med"
    subnet_name = "medellin-med-endabank-management-subnet"
    subnet_cidr_range = "10.0.0.0/24"
    network_name = module.networking.network-name
    region = "us-central1"
    private_ip_google_access = "false"

    depends_on = [module.networking]

}

module "backend-subnet" {    #Managment subtets module for private instances, in that case for backend cluster
    source = "./src/modules/subnet"

    project_id = "medellin-med"
    subnet_name = "medellin-med-endabank-backend-subnet"
    subnet_cidr_range = "10.0.1.0/24"
    network_name = module.networking.network-name
    region = "us-central1"
    private_ip_google_access = "false"

    depends_on = [module.networking]
    
}

module "ssh-endbank-rule" {     #Firewall rule to enable SSH connection
    source = "./src/modules/firewall_rules"

    fw_name = "medellin-med-endabank-ssh-rule"
    network = module.networking.network-name
    description = "allow http and https traffic"
    source_ranges = ["0.0.0.0/0"]
    protocol = "tcp"
    ports = ["22", "80", "443"]
    target_tags = ["http-server", "https-server"]
    
    depends_on = [module.networking]
    
}

module "jenkins-endbank-rule" {     #Firewall rule to enable 8080 port for Jenkins services
    source = "./src/modules/firewall_rules"

    fw_name = "medellin-med-endabank-jenkins-rule"
    network = module.networking.network-name
    description = "allow jenkins port"
    source_ranges = ["0.0.0.0/0"]
    protocol = "tcp"
    ports = ["8080"]
    target_tags = ["http-server", "https-server","jumbox-host"]
    depends_on = [module.networking]
    
}

module "backend-endabank-rule" {    #Firewall rule to enable all ports requireds for backend instance
    source = "./src/modules/firewall_rules"

    fw_name = "medellin-med-endabank-backend-rule"
    network = module.networking.network-name
    description = "allow backend ports"
    source_ranges = ["0.0.0.0/0"]
    protocol = "tcp"
    ports = ["8080","5432","9000"]
    target_tags = ["backend-dev"]
    depends_on = [module.networking]

  
}
module "cloud-nat" {    #Cloud Nat to enable internet ingress and egress to private instances
    source = "./src/modules/nat"

    router_name = "medellin-med-endabank-router"
    subnet_region = module.backend-subnet.subnet-region
    network_id = module.networking.network-id

    
    nat_name = "medellin-med-endabank-nat"
    source_subnet_id = module.backend-subnet.subnet-id

    depends_on = [module.backend-subnet]
    
}


module "server-node" {     #servers cluster instance
    source = "./src/modules/compute_engine_private"

    instance_name = "medellin-med-endabank-backend-development" 
    instance_zone = "us-central1-a"
    tags = ["http-server", "https-server", "backend-dev"]
    can_ip_forward = true
    instance_type = "e2-medium"
    allow_stopping_for_update = true
    instance_image ="debian-10-buster-v20220118"
    subnetwork = module.backend-subnet.subnet-id
    depends_on = [module.backend-subnet]

    
}

module "ci-cd-jumbox-host" { #CI/CD instance
    source = "./src/modules/compute_engine_public"

    instance_name = "medellin-med-endabank-ci-cd-jumbox-host"
    instance_zone = "us-central1-a"
    tags = ["http-server", "https-server", "jumpbox-host"]
    instance_type = "e2-medium"
    allow_stopping_for_update = true
    instance_image = "ubuntu-os-cloud/ubuntu-2004-lts" 
    subnetwork = module.management-subnet.subnet-id
    depends_on = [module.management-subnet]

    script = "install-puppet.sh"  #start script to install puppet CM tool
}

module "frontend_bucket" {      #Bucket services
    source = "./src/modules/cloud_storage"
    
    bucket_name             = "medellin-med-endabank-frontend-dev"
    project_id              = "medellin-med"
    bucket_region           = "us-central1"
    bucket_force_destroy    = true

    uniform_bucket_level_access = true

    bucket_main_page_suffix = "index.html"
    bucket_not_page_found   = "404.html"
  
    bucket_origin          = ["http://med-endabank-frontend.com"]
    bucket_method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    bucket_response_header = ["*"]
    bucket_max_age_seconds = 3600
}

module "database" {   #Postgress SQL database module
    
    source = "./src/modules/sql_services"
    
    private_ip_name = "database-private-connenction"
    purpose = "VPC_PEERING"
    address_type = "INTERNAL"
    private_ip_address_version = "IPV4"
    prefix_length = 20
    private_network_name_ip_address = module.networking.network-self-link #network-name

    network_name = module.networking.network-self-link # .network-name
    service = "servicenetworking.googleapis.com"
    reserved_peering_ranges = module.database.reserved-peering-ranges

    database_name = "medellin-med-endabank-database-postgres" 
    database_instance =  module.database.database-name 

    database_instance_name = "medellin-med-endabank-database-primary-postgres"
    database_region = var.region
    database_version = "POSTGRES_13"
    deletion_protection = false
    depends_on_database = [module.database.depends-on-database]#[google_service_networking_connection.private_vpc_connection]
    database_tier = "db-g1-small"
    availability_type = "REGIONAL"
    disk_size = 10 
    database_backup = true
    ipv4_enabled = false
    private_network_instance = module.networking.network-self-link

    database_user_name = var.db_user#This credentials are storage in terraform cloud variables, and the type of the variables musty be sensitive
    database_instance_credentials = module.database.database-name
    database_password = var.db_password#This credentials are storage in terraform cloud variables, and the type of the variables musty be sensitive
}