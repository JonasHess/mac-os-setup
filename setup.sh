#!/bin/bash
set -e

# Ensure the current directory is set to the location of the script
cd "$(dirname "$0")"

# Define the paths
CONFIG_YML="$(pwd)/config.yml"
MAC_DEV_PLAYBOOK="mac-dev-playbook"

# Check if the symlink already exists
if [ ! -L "$MAC_DEV_PLAYBOOK/config.yml" ]; then
    # Symlink the file 'config.yml' into the subdirectory mac-dev-playbook
    echo "Creating symlink for config.yml in mac-dev-playbook directory..."
    ln -sf "$CONFIG_YML" "$MAC_DEV_PLAYBOOK/config.yml"
else
    echo "Symlink already exists, skipping..."
fi

# cd into the subdirectory 'mac-dev-playbook'
echo "Entering mac-dev-playbook directory..."
cd "$MAC_DEV_PLAYBOOK"

# Install Ansible roles from requirements.yml
echo "Installing Ansible roles..."
ansible-galaxy install -r ./requirements.yml

# Run the playbook with elevated privileges
echo "Running Ansible playbook..."
ansible-playbook ./main.yml --ask-become-pass

# Inform the user about successful completion
echo "Setup completed!"
