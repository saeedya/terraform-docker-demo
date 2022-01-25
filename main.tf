terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

variable "my_database" {
  type = string
  description = "MySQL Database"
  default = "mysql"
}

resource "random_password" "mysql_root_password" {
  length = 16
}

resource "docker_image" "mysql" {
  name = "mysql:latest"
}

resource "docker_container" "mysql" {
  name = var.my_database
  image = "${docker_image.mysql.name}"
  ports {
    internal = "3306"
    external = "33306"
  }
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_password.result}"
  ]
}

output "ip_address" {
  value = docker_container.mysql.ip_address
  description = "The IP address of container"
}

output "id" {
  value = docker_container.mysql.id
  description = "The id of container"
}

output "image" {
  value = docker_container.mysql.image
  description = "The image of container."
}
