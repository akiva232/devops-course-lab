output "server_url" {
  description = "The URL to access the web server"
  value       = "http://localhost:${var.external_port}"
}