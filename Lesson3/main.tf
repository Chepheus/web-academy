module "gitlab_module" {
  source              = "./modules/gitlab"
  gitlab_project_list = var.gitlab_project_list
}

module "minio_module" {
  source                = "./modules/minio"
  minio_user_access_key = var.minio_user_access_key
  minio_user_secret_key = var.minio_user_secret_key
  minio_user_list       = var.minio_user_list
}