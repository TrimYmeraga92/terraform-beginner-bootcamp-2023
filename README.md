# Terraform Beginner Bootcamp 2023

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