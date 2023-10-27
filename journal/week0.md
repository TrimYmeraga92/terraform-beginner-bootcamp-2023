# Terraform Beginner Bootcamp 2023 - Week 0

- [Semantic Versioning 2.0.0 :mage:](#semantic-versioning-200--mage-)
  * [Install the Terraform CLI](#install-the-terraform-cli)
    + [Considerations with the Terraform CLI changes](#considerations-with-the-terraform-cli-changes)
    + [Considerations for Linux Distribution](#considerations-for-linux-distribution)
    + [Refactoring into Bash Scripts](#refactoring-into-bash-scripts)
    + [Shebang Considerations](#shebang-considerations)
    + [Execution Considerations](#execution-considerations)
    + [Linux Permissions Considerations](#linux-permissions-considerations)
    + [Github Lifecycle (Before, Init, Command)](#github-lifecycle--before--init--command-)
    + [Working Env Vars](#working-env-vars)
      - [env command](#env-command)
      - [Setting and Unsetting Env Vars](#setting-and-unsetting-env-vars)
  * [Printing Vars](#printing-vars)
      - [Scoping of Env Vars](#scoping-of-env-vars)
      - [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
    + [AWS CLI Installation](#aws-cli-installation)
- [Terraform Basics](#terraform-basics)
    + [Terraform Registry](#terraform-registry)
  * [Terraform Console](#terraform-console)
      - [Terraform Init](#terraform-init)
      - [Terraform Plan](#terraform-plan)
      - [Terraform apply](#terraform-apply)
    + [Terraform destroy](#terraform-destroy)
    + [Terraform lock Files](#terraform-lock-files)
    + [Terraform State Files](#terraform-state-files)
    + [Terraform Directory](#terraform-directory)
  * [Issues with Terraform Cloud Login and Gitpod Workspace](#issues-with-terraform-cloud-login-and-gitpod-workspace)


# Semantic Versioning 2.0.0 :mage:


This Project is going to utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)
Given a version number **MAJOR.MINOR.PATCH**, increment the:

- MAJOR version when you make incompatible API changes
- MINOR version when you add functionality in a backward compatible manner
- PATCH version when you make backward compatible bug fixes
- Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install the Terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI Installation instructions have changed due to gpg keyring changes. So we needed to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for Install

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution

This project is build against Ubuntu. 
Please consider checking your Linux Distribution and change accordingly to distribution needs.

[(https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)]

Example of checking OS version:

```
cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg deprication issues we notice that bash scripts steps were a considerable amound more code. So we decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli.sh)

- This will keep the Gitpod Task ([gitpod.yml])file tidy.
- This allow us an easier to debug and execute manuallz Terraform CLI install
- This will allow better portability for other projects that need to install Terraform CLI.

### Shebang Considerations

A Shebang (pronounced Sha-bang) tells the bash script what program that will interpret the script. eg. `#!/bin/bash`

ChatGpt recommended this format for bash: `#!/usr/bin/env bash`

- for portability for different OS distributions
- will search the user's PATH for the bash executable

When executing the bash script we can use the `./` shorthand notiation to execute the bash script.

https://en.wikipedia.org/wiki/Shebang_(Unix)

### Execution Considerations

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to a program to interpret it.

eg. `source ./bin/install_terraform_cli`

### Linux Permissions Considerations

In order to make our bash script executable we need to change linux permission for the file to be executable at the user mode.
```sh
chmod u+x ./bin/install_terraform_cli
```
 alternatively:
```sh
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod


### Github Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks


### Working Env Vars

#### env command

We can list out all Environment Variables (Env Vars) using the `env` command


We can filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can ser using `export HELLO = 'world`

In the terminal we can unset using `unset HELLO`

we can set an env var temporarily when just running a command

```sh
HELLO ='world' ./bin/print_message

```

Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO = 'world'

echo $HELLO 
```

## Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of evn vars that you have set in antother window.

If you want to Env Vars to persist accress all future bash terminals that you are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secret Storage.

```
gp env HELLO='world'
```

All future workspaves launched will set the env vars for all bash terminals opened in thoes workspaces.


### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli.sh)

[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)



We can check if our AWS is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

If it is succesful you should see a json payload return that looks like this:

```json
{
    "UserId": "LIGATRZVFKQJJCDVE4E7U",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform"
}
```

We'll need to generate AWS CLI credits from IAM User in order to use the AWS CLI.



# Terraform Basics

### Terraform Registry

Terraform sources their providers and modules from the Terraform registry which located at registry [registry.terraform.io] (https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow you to create resources in terraform.
- **Module** are a way to make large amounts of terraform code modular, portable, and shareble.

[Random Terraform provider](https://registry.terraform.io/browse/providers)

## Terraform Console

we can see a list of all the Terraform commands by simply typing `terraform`


#### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project.

#### Terraform Plan 

`terraform plan`

This will generate out a changeset, about the state of our infrastructure and what will be changed.

We can output this changeset ie. "plan" to be passed to an apply, but often you can just ignore out putting.

#### Terraform apply

`terraform apply`

This will run a plan and pass the changeset to be executed by terraform. Apply should promt us yes or no.

If we want to automatically approve an apply we can provide the auto approve flag. eg. `terrafrom apply --auto-approve`

### Terraform destroy 

`terraform destroy`

This will destroy all resources in directory in which this is applied

### Terraform lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The Terraform lock File should be commited to your version control system (VCS) eg. Github

### Terraform State Files

`.terraform.tfstate` contains information about the current state of your infrastructure.

This file **should not be commited** to your VCS.

This file can contain sensitive data.

If you lose this file, you lose knowing the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state.

### Terraform Directory

`.terraform` directory contains binaries of terraform providers.


## Issues with Terraform Cloud Login and Gitpod Workspace

When attempting to run `terraform login` it will launch bash a wiswig view to generate a token. However it does not work expected in Gitpod VsCode in the browser.

The workaround ismanually generate a token in Terraform Cloud

```
https://app.terraform.io/app/settings/tokens
```

Then create and open file manually here:

```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
open  /home/gitpod/.terraform.d/credentials.tfrc.json
```

Provide the following code (replace your token in the file):

```json
{
    "credentials": {
      "app.terraform.io": {
        "token": "your token"
      }
    }
  }
```

We have automated this workaround with the following bash script [bin/generate_tfrc_credentials](bin/generate_tfrc_credentials.sh)


