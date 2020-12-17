#!/usr/bin/env bash

REPO_ROOT=$(git rev-parse --show-toplevel)

need() {
    which "$1" &>/dev/null || die "Binary '$1' is missing but required"
}

message() {
  echo -e "\n######################################################################"
  echo "# $1"
  echo "######################################################################"
}

need flux

message "Generating a new flux components yaml"

flux install \
    --export \
    --dry-run \
    --components=source-controller,kustomize-controller,helm-controller,notification-controller \
    --network-policy=false > $REPO_ROOT/cluster/flux-system/gotk-components.yaml
