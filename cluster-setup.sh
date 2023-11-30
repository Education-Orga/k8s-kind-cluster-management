#!/bin/bash

CONFIG_PATH="./configs"

for CONFIG_FILE in "${CONFIG_PATH}"/*.yaml; do

    kind create cluster --config="${CONFIG_FILE}"
done