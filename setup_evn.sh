#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Name of the virtual environment directory
VENV_DIR=".venv"

# Create virtual environment
echo "Creating virtual environment in ./$VENV_DIR"
python3 -m venv $VENV_DIR

# Activate the virtual environment
echo "Activating virtual environment"
source $VENV_DIR/bin/activate

VENV_PATH=$(which python3)
echo $VENV_PATH
# Upgrade pip
echo "Upgrading pip"
$VENV_PATH -m pip install --upgrade pip

# Install packages from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing packages from requirements.txt"
    $VENV_PATH -m pip install -r requirements.txt
else
    echo "No requirements.txt found. Installing default packages..."
    $VENV_PATH -m pip install django~=4.2.0 black  # Add your default packages here
fi

echo "Setup complete. Virtual environment is ready."

echo "To activate the virtual environment, run:"
echo "source $VENV_DIR/bin/activate"


# to run this script : chmod +x setup_env.sh
# ./setup_env.sh
