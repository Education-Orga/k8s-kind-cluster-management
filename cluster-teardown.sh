#!/bin/bash

CONFIG_PATH="./configs/clusters"

echo
tput setaf 3; echo "Removing Edge-Cluster and Application-Cluster"; tput sgr0
echo

for CONFIG_FILE in "${CONFIG_PATH}"/*.yaml; do

    CLUSTER_NAME=$(basename "${CONFIG_FILE}" .yaml)

    kind delete cluster --name="${CLUSTER_NAME}"
done

echo
tput setaf 2; echo "Clusters removed. See kind contexts below:"; tput sgr0
kind get clusters