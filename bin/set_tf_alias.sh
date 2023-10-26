#!/usr/bin/env bash

# Define the alias
alias tf="terraform"

# Check if the alias already exists in .bash_profile
if grep -q "alias tf=\"terraform\"" ~/.bash_profile; then
    echo "Alias 'tf' already exists in .bash_profile."
else
    # If not, add it to .bash_profile
    echo "alias tf=\"terraform\"" >> ~/.bash_profile
    echo "Alias 'tf' added to .bash_profile."
fi

# Load the updated .bash_profile
source ~/.bash_profile
