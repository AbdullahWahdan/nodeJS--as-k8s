#!/bin/bash


echo "Starting minikube..."
if ! minikube status &>/dev/null; then
    echo "Minikube is not running. Starting minikube..."
    minikube start
else
    echo "Minikube is already running."
fi

echo "Deleting existing deployment and PVC if they exist..."
kubectl delete deployment nodejs-app --ignore-not-found
kubectl delete pvc nodejs-app-pvc --ignore-not-found


echo "Applying PersistentVolumeClaim..."
kubectl apply -f pvc.yaml

echo "Applying deployment..."
kubectl apply -f deployment.yaml

echo "Waiting for deployment to complete..."
kubectl rollout status deployment/nodejs-app
