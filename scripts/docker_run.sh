#!/bin/bash

printf "\n\nStarting the server!\n\n"

SD_PATH=`pwd`

export INSTALL_ENV_DIR="$(pwd)/installer_files/env"
export PATH="$(pwd)/installer_files/env/bin:$PATH"
export PYTORCH_ENABLE_MPS_FALLBACK=1
export PYTHONPATH="$INSTALL_ENV_DIR/lib/python3.8/site-packages"
echo "PYTHONPATH=$PYTHONPATH"

which python
python --version

export SD_UI_PATH=`pwd`/ui
cd /easy-diffusion/stable-diffusion

uvicorn main:server_api --app-dir "$SD_UI_PATH" --port ${SD_UI_BIND_PORT:-9000} --host ${SD_UI_BIND_IP:-0.0.0.0} --log-level error

read -p "Press any key to continue"
