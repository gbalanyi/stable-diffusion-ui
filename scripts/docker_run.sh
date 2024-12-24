#!/bin/bash

printf "\n\nStarting the server!\n\n"

export INSTALL_ENV_DIR="$(pwd)/installer_files/env"
export PATH="$(pwd)/installer_files/env/bin:$PATH"

which python
python --version

python scripts/check_modules.py --launch-uvicorn

read -p "Press any key to continue"
