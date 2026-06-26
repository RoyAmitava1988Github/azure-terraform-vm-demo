# Azure VM Terraform Pipeline

This repository deploys an Ubuntu Linux VM on Azure with Terraform modules and an Azure DevOps pipeline.

## Resources

- Resource group
- Virtual network and subnet
- Network security group with SSH and HTTP rules
- Static public IP
- Network interface
- Ubuntu 22.04 Linux VM
- Cloud-init bootstrap for Nginx, Python 3, and pip

## Repository layout

```text
azure_pipelines/          Azure DevOps pipeline definitions
envs/dev/                 Dev Terraform root module
envs/prod/                Placeholder for future prod environment
modules/                  Reusable Terraform modules
```

## Required Azure DevOps setup

Create or update the Azure DevOps service connection named `sc-identity-federation` to use workload identity federation for the target Azure subscription.

The pipeline uses these Terraform authentication environment variables from `AzureCLI@2`:

- `ARM_CLIENT_ID`
- `ARM_TENANT_ID`
- `ARM_SUBSCRIPTION_ID`
- `ARM_USE_OIDC`
- `ARM_OIDC_TOKEN`

## Dev deployment values

Before running a real deployment, confirm the subscription ID, region, resource names, VM size, and tags in [envs/dev/terraform.tfvars](envs/dev/terraform.tfvars).

For Azure DevOps deployments, create these pipeline variables:

- `sshPublicKey`: your real OpenSSH public key, for example the contents of `id_rsa.pub` or `id_ed25519.pub`.
- `allowedSshSourceIp`: your public IP in CIDR format, for example `203.0.113.10/32`.

The pipeline passes those values to Terraform during `plan`, so you do not need to commit personal SSH access values into `terraform.tfvars`.

For local deployments, replace these placeholders in [envs/dev/terraform.tfvars](envs/dev/terraform.tfvars):

- `PASTE-YOUR-SSH-PUBLIC-KEY-HERE`
- `YOUR_PUBLIC_IP/32`

Terraform validation now rejects the placeholder SSH key and placeholder SSH source IP during planning.

## Pipeline flow

The pipeline in [azure_pipelines/azure-pipelines-deploy.yml](azure_pipelines/azure-pipelines-deploy.yml) runs three stages:

1. `Validate`: install Terraform, run `terraform fmt -check -recursive`, initialize the dev root module, and run `terraform validate`.
2. `Plan`: initialize the dev root module and publish a `tfplan` artifact.
3. `Apply`: download the published plan and apply it. This stage is skipped for pull requests.

## Local testing

From the repository root:

```bash
terraform fmt -check -recursive
```

From `envs/dev`:

```bash
terraform init -backend=false -input=false
terraform validate
terraform plan -input=false -var-file=terraform.tfvars
```

On Windows ARM64, the AzureRM provider version selected by `~> 4.35` may not provide a compatible local provider package. The Azure DevOps pipeline runs on `ubuntu-latest` x64 and is the recommended validation path for this repository.
