# Exercice 2.1 - Déployer Nginx

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Image Nginx
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Conteneur Nginx
resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = var.external_port
  }
}
