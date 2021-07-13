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

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
