#!/bin/bash

echo "Applying deployment..."
echo "kubectl apply -f deployment.yaml"
kubectl apply -f deployment.yaml

echo "Watching pods with label app=nodejs..."
echo "kubectl get pods -l app=nodejs -w"
kubectl get pods -l app=nodejs -w
