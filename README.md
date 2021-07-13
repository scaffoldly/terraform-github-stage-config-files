[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-github-stage-config-files)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Write stage config files to a GitHub repository:

- `.scaffoldly/services.json`
- `.scaffoldly/env-vars.json`
- `.scaffoldly/.env`

## Usage

```hcl
module "stage_files" {
  count  = length(var.stages)
  source = "./stage-files"

  repository_name        = var.repository_name
  service_name           = var.service_name
  repository_description = data.github_repository.repository.description
  branch                 = data.github_repository.repository.default_branch

  stage_name = var.stages[count.index]

  stage_config = {
    for key, value in var.services :
    key => lookup(value, var.stages[count.index])
  }

  env_vars = lookup(var.stage_env_vars, var.stages[count.index])

  shared_env_vars = var.shared_env_vars
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 4.9.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.9.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository_file.env](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/repository_file) | resource |
| [github_repository_file.env_vars_json](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/repository_file) | resource |
| [github_repository_file.services_json](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch"></a> [branch](#input\_branch) | The default branch of the repository | `string` | n/a | yes |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | Environment variables exclusive to this repo/and stage | `map(string)` | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | The description of the repository, will be added to the APPLICATION\_FRIENDLY\_NAME environment variable | `string` | `""` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The repository name to add stage config files to | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The service name | `string` | n/a | yes |
| <a name="input_shared_env_vars"></a> [shared\_env\_vars](#input\_shared\_env\_vars) | Global environment variables to merge in to the environment variables | `map(string)` | n/a | yes |
| <a name="input_stage_config"></a> [stage\_config](#input\_stage\_config) | The full stage config, initially keyed by stage name, followed by a map of the various properties for a stage | `map(map(string))` | n/a | yes |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | The name of the stage for the provided config. Used to prefix filenames | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
