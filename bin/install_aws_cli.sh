#!/usr/bin/env bash

cd /workspace
         rm --force '/workspace/awscli2.zip'
         rm -rf '/workspace/aws'
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip awscliv2.zip
      sudo ./aws/install

      aws sts get-caller-identity

      
 cd $PROJECT_ROOT

