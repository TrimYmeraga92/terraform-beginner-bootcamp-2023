#!/usr/bin/env bash

# Check if the TERRAFORM_CLOUD_TOKEN environment variable is set
if [ -z "$TERRAFORM_CLOUD_TOKEN" ]; then
  echo "Error: TERRAFORM_CLOUD_TOKEN environment variable is not set."
  exit 1
fi

# Define the target directory
credentials_dir="/home/gitpod/.terraform.d"
credentials_file="$credentials_dir/credentials.tfrc.json"

# Create the directory if it doesn't exist
if [ ! -d "$credentials_dir" ]; then
  mkdir -p "$credentials_dir"
fi

# Create the JSON structure and write it to the credentials.tfrc.json file
cat <<EOF > "$credentials_file"
{
  "credentials": {
    "app.terraform.io": {
      "token": "$TERRAFORM_CLOUD_TOKEN"
    }
  }
}
EOF

echo "$credentials_file file generated with the provided token."
