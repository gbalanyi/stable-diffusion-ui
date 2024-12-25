#!/bin/bash

printf "\n\nStarting the server!\n\n"

export INSTALL_ENV_DIR="$(pwd)/installer_files/env"
export PATH="$(pwd)/installer_files/env/bin:$PATH"
export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libGLdispatch.so.0

which python
python --version

python scripts/check_modules.py --launch-uvicorn

read -p "Press any key to continue"
