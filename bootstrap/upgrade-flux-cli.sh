#!/usr/bin/env bash

REPO_ROOT=$(git rev-parse --show-toplevel)

curl -s https://toolkit.fluxcd.io/install.sh | sudo bash