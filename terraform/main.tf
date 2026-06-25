terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image" {
  name         = "nginx:alpine"
  keep_locally = false
}

resource "docker_container" "nginx_server" {
  image = docker_image.nginx_image.image_id
  name  = var.container_name # שימוש במשתנה שם

  ports {
    internal = 80
    external = var.external_port # שימוש במשתנה פורט
  }
}