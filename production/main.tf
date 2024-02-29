# Create Resource for Production Environment

module "docker-registry" {
    source      = "../modules/docker-registry"

    environment = var.env
    folder_id = var.YC_FOLDER_ID
}

# module "frontend" {
#    source      = "../modules/frontend"

#    environment = var.env
#    frontend_memory = 512
#}

module "user-storage" {
    source      = "../modules/user-storage"
  
}