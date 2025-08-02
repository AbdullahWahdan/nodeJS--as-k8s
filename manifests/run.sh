#!/bin/bash

set -e  # Exit immediately if a command fails

echo "🚀 Starting minikube..."
if ! minikube status &>/dev/null; then
    echo "Minikube is not running. Starting minikube..."
    minikube start
else
    echo "✅ Minikube is already running."
fi

echo "🧹 Cleaning up old resources..."
kubectl delete deployment nodejs-app --ignore-not-found
kubectl delete pvc nodejs-app-pvc --ignore-not-found
kubectl delete service nodejs-service --ignore-not-found

echo "📦 Applying PersistentVolumeClaim..."
kubectl apply -f pvc.yaml

echo "🌐 Applying LoadBalancer service..."
kubectl apply -f service.yaml

echo "📦 Applying Deployment..."
kubectl apply -f deployment.yaml

echo "⏳ Waiting for rollout to complete..."
kubectl rollout status deployment/nodejs-app

echo "✅ Initial Deployment successful."

echo "🔄 Updating image to karimzakzouk/nodejs-hello:v2..."
kubectl set image deployment/nodejs-app nodejs=karimzakzouk/nodejs-hello:v2 # aw033/nodejs-hello:v1
kubectl rollout status deployment/nodejs-app

echo "📄 Describing deployment..."
kubectl describe deployment nodejs-app

echo "↩️ Undoing rollout (rollback)..."
kubectl rollout undo deployment/nodejs-app

echo "📄 Describing deployment after rollback..."
kubectl describe deployment nodejs-app


echo "✅ All tasks completed successfully."
