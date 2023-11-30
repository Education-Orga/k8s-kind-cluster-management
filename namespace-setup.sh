#!/bin/bash

CONFIG_BASE_PATH="./configs/namespaces"
CONTEXT_EDGE="kind-edge-cluster"
CONTEXT_CLUSTERS="kind-application-cluster"

# Funktion, um Konfigurationen in einem bestimmten Kontext anzuwenden
apply_configs_in_context() {
    local CONTEXT=$1
    local CONFIG_PATH=$2

    for CONFIG_FILE in "${CONFIG_PATH}"/*.yaml; do
        kubectl apply -f "${CONFIG_FILE}" --context="${CONTEXT}"
    done
}

# Anwenden der Konfigurationen im Edge-Kontext
apply_configs_in_context "${CONTEXT_EDGE}" "${CONFIG_BASE_PATH}/edge"

# Anwenden der Konfigurationen im Clusters-Kontext
apply_configs_in_context "${CONTEXT_CLUSTERS}" "${CONFIG_BASE_PATH}/application"
