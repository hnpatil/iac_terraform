# IAC with terraform

This is a terraform setup to provision
- VPC with private and public subnets.
- An RDS instance
- An EKS cluster with a node group

## Setup

### Install tooling

```shell
brew install tfenv awscli aws-iam-authenticator kubectl krew tflint google-cloud-sdk

kubectl krew install konfig

tfenv use min-required
````
### Setup AWS credentials

- Add `AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY & AWS_DEFAULT_REGION` to `.envrc`
- Either run `direnv allow` to add the env variables automatically or run `source .envrc` manually when you need them

### Verify setup

Please run `aws sts get-caller-identity`, the output should look like this with your user details:

```json
{
    "UserId": "AIDAYFNDTNFEP46GXLKMN",
    "Account": "561373210952",
    "Arn": "arn:aws:iam::561373210952:user/admin"
}
```

### Commands
Use the following `make` commands as needed:
* `init` initialize a working directory and install plugins for required providers
* `plan` Plan changes to infrastructure
* `apply` Apply changes to infrastructure
* `destroy` Destroy infrastructure
* `eks_auth` Retrieve the access credentials for your cluster and configure `kubectl`
