terraform {
  backend "remote"{
      hostname ="app.terraform.io"
      organization = "Medellin-Med-Endabank"

    workspaces {
      name = "MED_Endabank_Environment_Setup"
    }
  }
}