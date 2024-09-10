#!/bin/bash

# Run bash into nepsys-lsp docker image
# Prerequisites
# -------------
#
# The Docker image must have been built:
#
#     docker build -t nepsys-pylsp -f Dockerfile-pylsp .

docker run --rm -ti --entrypoint=/bin/bash --volume "$HOME/nepsys/modules/optimize-recipe:/code/optimize-recipe" nepsys-pylsp -s
