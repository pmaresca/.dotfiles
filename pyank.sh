#!/bin/bash

# Usage: ./pyank.sh <namespace>

# Check if a namespace argument is provided
if [ "$#" -ne 1 ]; then
  # Use kubectl to get a list of available namespaces and present them for selection
  available_namespaces=$(kubectl get namespaces -o custom-columns=":metadata.name" | tail -n +2)
  selected_namespace=$(echo "$available_namespaces" | fzf --prompt "Namespace not provided. Select a namespace: ")
  if [ -z "$selected_namespace" ]; then
    echo "No namespace selected. Exiting."
    exit 1
  else
    namespace="$selected_namespace"
  fi
else
  namespace="$1"
fi

# Use kubectl to get a list of pod names in the specified namespace
pod_list=$(kubectl get pods -n "$namespace" -o custom-columns=":metadata.name" | tail -n +2)
# Use fzf to select a pod interactively
selected_pod=$(echo "$pod_list" | fzf --prompt "Select a pod: ")

printf "%s" "$selected_pod" | pbcopy
echo "$selected_pod from n: $namespace copied to clipboard"
