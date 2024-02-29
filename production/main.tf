# Create Resource for Production Environment

module "docker-registry" {
    source      = "../modules/docker-registry"

    environment = var.Env
    folder_id = var.YC_FOLDER_ID
}

module "frontend" {
    source      = "../modules/frontend"

    environment = var.env
    frontend_memory = 512
}