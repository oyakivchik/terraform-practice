#### Network ####
name = "my-stage-vpc"

cidr = "10.20.0.0/16"

azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

public_subnets   = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]
private_subnets  = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
database_subnets = ["10.20.201.0/24", "10.20.202.0/24", "10.20.203.0/24"]

enable_nat_gateway     = true
single_nat_gateway     = true
one_nat_gateway_per_az = false

#### Compute ####
key_name = "default"

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCGnxOlb07o5zJ2mIC2qWISTb/qX3b6NUR+8UdFryjj4bus0cDssVOvGO3Wy3wVW7dbCDDbGegzk7J2C1ygbP90TSp+OfG890rdc2aEDMTmhSZM4ckJyTL6LlAm5iHy8CLks9rRhhUOvtsMwGyMziVPpYL6rxW9HODM2HnZvGCOG+v3EpPF2DHjjKOZY4PFTqz3DrJGGHR90BoPeeEB5qt/H8TqjI5Mui8TcE+1nqlgTmf0o1NtZcjEb0PKl6XPcbkfpMUfN7GfTuSN0a8yCHXiaDnVagbpH+g1fL2SXNTPG8nN1ONaAuA/TDsYS7lP6ZNyNv5nLyYb3LF0zqU9bS/OSXWfuzL2SZZ5PuG11P7Gs+1+bqM+MFq+JrKp5hy5L5jhTK10dL+L6wP2kGCnpW4FoSlRZKktd2qPkWDQZarlqV1rHL4J9tuIBnaVS8o2/uekbZKAy6oABfTP1+8h+hdEo8aeG50drVoXOlKVPr4HYFQc1T+fe3Al+IdJRkwpg6E= oyakivchik@DESKTOP-PQR5KLQ"

ami = "ami-0b0dcb5067f052a63"

instance_type = "t2.micro"

alb_name = "stage-lb"

instance_dict = [
  {
    name      = "stage-instance-1"
    subnet_id = "0"
  },
  {
    name      = "stage-instance-2"
    subnet_id = "1"
  },
  {
    name      = "stage-instance-3"
    subnet_id = "2"
  }
]

#### DB ####
identifier           = "demodb"
engine               = "mysql"
engine_version       = "5.7.33"
instance_class       = "db.t3.micro"
allocated_storage    = 5
db_name              = "stage-db"
username             = "user"
port                 = "3306"
family               = "mysql5.7"
major_engine_version = "5.7"
deletion_protection  = false
parameters = [{
  name  = "character_set_client"
  value = "utf8mb4"
  },
  {
    name  = "character_set_server"
    value = "utf8mb4"
}]