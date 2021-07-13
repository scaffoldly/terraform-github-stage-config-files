variable "repository_name" {
  type        = string
  description = "The repository name to add stage config files to"
}
variable "service_name" {
  type        = string
  description = "The service name"
}
variable "repository_description" {
  type        = string
  default     = ""
  description = "The description of the repository, will be added to the APPLICATION_FRIENDLY_NAME environment variable"
}
variable "branch" {
  type        = string
  description = "The default branch of the repository"
}
variable "stage_name" {
  type        = string
  default     = ""
  description = "The name of the stage for the provided config. Used to prefix filenames"
}
variable "stage_config" {
  type        = map(map(string))
  description = "The full stage config, initially keyed by stage name, followed by a map of the various properties for a stage"
}
variable "env_vars" {
  type        = map(string)
  description = "Environment variables exclusive to this repo/and stage"
}
variable "shared_env_vars" {
  type        = map(string)
  description = "Global environment variables to merge in to the environment variables"
}
