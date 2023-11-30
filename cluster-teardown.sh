#!/bin/bash

CONFIG_PATH="./configs"

for CONFIG_FILE in "${CONFIG_PATH}"/*.yaml; do

    CLUSTER_NAME=$(basename "${CONFIG_FILE}" .yaml)

    kind delete cluster --name="${CLUSTER_NAME}"
done