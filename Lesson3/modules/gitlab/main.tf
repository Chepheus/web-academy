provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.gitlab_base_url
}

resource "gitlab_group" "test-group" {
  name        = "test-group"
  path        = "test-group"
  description = "Test group for GitLab"
}

resource "gitlab_project" "test-project" {
  for_each     = toset(var.gitlab_project_list)
  name         = "test-project-${each.value}"
  description  = "${each.value} project for GitLab"
  path         = "test-project-${each.value}"
  namespace_id = gitlab_group.test-group.id
}