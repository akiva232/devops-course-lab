variable "container_name" {
  description = "The name of the Docker container"
  type        = string
  default     = "devops_lab_nginx_prod"
}

variable "external_port" {
  description = "The external port for the web server"
  type        = number
  default     = 8081 # נשנה ל-8081 כדי לראות את השינוי!
}