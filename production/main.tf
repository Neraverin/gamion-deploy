# Create Resource for Production Environment

module "docker-registry" {
    source      = "../modules/docker-registry"

    Environment = var.Env
    Folder_id = var.YC_FOLDER_ID
}

module "frontend" {
    source      = "../modules/frontend"

    Environment = var.Env
    Frontend_memory = 512
}