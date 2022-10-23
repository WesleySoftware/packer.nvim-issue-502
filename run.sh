#!/bin/bash
docker build -t neovim .
docker run -it --rm --name neovimtest \
-v ./config:/root/.config/nvim:z \
-v ./src:/src:z \
neovim
# uncomment to cleanup the docker image after running
# docker rmi neovim