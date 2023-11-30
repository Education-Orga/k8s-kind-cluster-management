#!/bin/bash

CONFIG_PATH="./configs/clusters"

echo
tput setaf 3; echo "Setting up Edge-Cluster and Application-Cluster"; tput sgr0
echo

for CONFIG_FILE in "${CONFIG_PATH}"/*.yaml; do

    kind create cluster --config="${CONFIG_FILE}"
done

echo
tput setaf 3; echo "Creating Namespaces ..."; tput sgr0

./namespace-setup.sh

echo
tput setaf 2; echo "Cluster Setup Done! See kind contexts below:"; tput sgr0
kind get clusters