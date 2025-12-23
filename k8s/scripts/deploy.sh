#!/bin/bash

echo "Deploying DesiGo to Kubernetes..."

# Clean up old deployment
kubectl delete namespace desigo --ignore-not-found=true
sleep 3

# Deploy
kubectl apply -k k8s/base/

echo ""
echo "Deployment submitted!"
echo "Waiting for pods to start..."
sleep 30

echo ""
echo "Current status:"
kubectl get all -n desigo

echo ""
echo "To access applications:"
echo "1. Storefront: http://localhost:8000"
echo "   kubectl port-forward -n desigo svc/storefront-service 8000:8000"
echo ""
echo "2. Backend: http://localhost:9000"
echo "   kubectl port-forward -n desigo svc/backend-service 9000:9000"
