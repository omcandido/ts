This is a template made to get data scientists new to Docker up to speed. The template contains a skeleton of configuration files and examples. It creates a development environment in VS Code that is GPU-ready and includes a selection of libraries for working with time series.
Includes the following libraries:
 - [MLForecast](https://nixtlaverse.nixtla.io/mlforecast/index.html)
 - [scikit-learn](https://scikit-learn.org/)
 - [XGBoost](https://xgboost.readthedocs.io/en/stable/)
 - [LightGBM](https://lightgbm.readthedocs.io/en/stable/)

 ## What you need
 To run this template project you need:
 - [Docker](https://docs.docker.com/engine/install/)
 - [VS Code](https://code.visualstudio.com/) (you can use another editor, but you may have to configure it yourself to work with Docker).

## How to run the environment
 1. Clone or download this repo
 2. Open the repo folder in VS Code
 3. Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension for VS Code.
 4. Make sure the Docker daemon is running in the background
 5. In VS Code, click on the blue icon at the bottom right corner and select "Reopen in Container". This will build the container -if it is the first time you run it- or will start an already existing one.

This will open your project folder as a volume shared between your windows host system and the container (more about [dev containers](https://code.visualstudio.com/docs/devcontainers/containers)). You can use VS Code as if you were in linux (run commands using the command line, run Jupyter notebooks using the Python image as your engine, etc.)

## Customisations
You can install your Python packages by running `pip install package_name`. Please note that whatever changes you make inside the container (environment variables, pip packages, system libraries, etc.) will be lost if you delete or rebuild the container.

If you want you make the changes to your container permanent, you will need to:
- Edit `./Dockerfile` with your changes.
- Build the new image locally: `docker build -t omcandido/ts`

Note that if you installed new Python packages and you exported your new dependencies (using `pip freeze > requirements.txt`) you will also need to rebuild the image.

 ## Troubleshooting
 - "My container is acting up": try rebuilding the container (click bottom right corner >> Rebuild container).
 - "I cannot rebuild the container": in the Docker app, find the container and stop it. Then try to rebuild it again. 
 - "My container is too slow": you may be running out of RAM. You can solve this by [editing the .wslconfig file](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) and increasing the memory available for Docker. You will need to shutdown WSL (by running `wsl --shutdown`) and restart Docker . **Note** that allocating too much RAM for Docker **may slow down you overall computer** if you do not have enough memory for other tasks.