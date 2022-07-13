## Steps to create a TCP load balancer in GCP:

1. Select TCP Load Balancing, and start configuration
2. The configuration of the TCP load balancer are the next:

![TCP Load Balancer](https://github.com/DavidSanchez2000/Medellin-Med-Endabank-DevOps/blob/master/IaC%20(Terraform)/TCPLB.PNG)

3. Backend Confuguration. 

The backend configuration section required us select the instances that we need load balance, for this part we select existing instances because we create the backend instance from the IaC, we only use one instance for the backend but if is necessary add more we can select all instances that will be necessary. In this section we select the instance of the backend to acces from the App Engine services that are the frontend services of the application.

In the heal cheack secction we created a healt check to review the state of the instance, but it's is no complety necessary, we recomend create it, the creation of the healt check is very simple, only select a name, not modify the other parameters and create this.

![Backend Configuration](https://github.com/DavidSanchez2000/Medellin-Med-Endabank-DevOps/blob/master/IaC%20(Terraform)/Backend_configuration.PNG)

4. Frontend Configuration:
The frontend configuration section required us a name of the IP taht is assigned to the load balancer, also if this IP is Ephemeral or static, this IP must be static because this is the endpoin to connect the frontend to the backend, and finally the port in that the backend run, the backend application run in the port 8080.

In the next image we can se the frontend configuration options

![Frontend Configuration](https://github.com/DavidSanchez2000/Medellin-Med-Endabank-DevOps/blob/master/IaC%20(Terraform)/Frontend_configuration.PNG)

To reserve and create a static IP we only select create IP address in the IP address section, and the only parameter that are required is the name.

In the next image we can se an example of create a new static IP address

![Frontend Configuration](https://github.com/DavidSanchez2000/Medellin-Med-Endabank-DevOps/blob/master/IaC%20(Terraform)/Frontend_reserve_static_IP_address)

