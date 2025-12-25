#!/bin/bash

echo "🚀 Deploying DesiGo Final Version"
echo "================================"

cd /Users/farrukhishaq/Documents/DesiGo

echo ""
echo "1. Building Docker images..."
docker build -t desigo-backend:latest -f desigo/Dockerfile ./desigo
docker build -t desigo-storefront:latest -f desigo-storefront/Dockerfile ./desigo-storefront

echo ""
echo "2. Cleaning up previous deployment..."
kubectl delete namespace desigo --ignore-not-found=true
sleep 5

echo ""
echo "3. Applying final YAML..."
kubectl apply -f k8s/all-in-one.yaml

echo ""
echo "✅ Deployment submitted!"
echo ""
echo "4. Waiting for pods to start..."
sleep 30

echo ""
echo "5. Checking status..."
kubectl get pods -n desigo -w
