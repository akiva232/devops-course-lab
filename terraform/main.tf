# 1. הגדרת ה-Providers (תוספים) שטרפורם צריכה להוריד
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "> 3.0.3" # גרסת התוסף של דוקר
    }
  }
}

# 2. הגדרת ה-Provider של דוקר (איך להתחבר ל-Daemon המקומי)
provider "docker" {
  # ב-Windows, טרפורם יודעת לגשת אוטומטית ל-Named Pipe של Docker Desktop
}

# 3. הגדרת משאב (Resource) מסוג Docker Image - נמשוך שרת Nginx פשוט מה-Hub
resource "docker_image" "nginx_image" {
  name         = "nginx:alpine"
  keep_locally = false
}

# 4. הגדרת משאב מסוג קונטיינר - נריץ את ה-Image שמשכנו
resource "docker_container" "nginx_server" {
  image = docker_image.nginx_image.image_id
  name  = "devops_lab_nginx"

  # הפניית פורטים: נפתח את פורט 8080 במחשב שלך לפורט 80 בתוך הקונטיינר
  ports {
    internal = 80
    external = 8080
  }
}

