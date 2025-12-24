#!/bin/bash

echo "🚀 Final Deployment - DesiGo with emptyDir"
echo "=========================================="

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
echo "3. Applying working YAML..."
kubectl apply -f k8s/all-in-one.yaml

echo ""
echo "✅ Deployment submitted!"
echo ""
echo "4. Waiting for pods to start..."
sleep 30

echo ""
echo "5. Checking status..."
for i in {1..6}; do
    echo ""
    echo "Check #$i:"
    kubectl get pods -n desigo

    RUNNING=$(kubectl get pods -n desigo --no-headers 2>/dev/null | grep -c "Running" || echo 0)
    TOTAL=$(kubectl get pods -n desigo --no-headers 2>/dev/null | wc -l || echo 0)

    if [ "$TOTAL" -eq 4 ] && [ "$RUNNING" -eq 4 ]; then
        echo ""
        echo "🎉 All 4 pods are running!"
        break
    fi

    if [ "$i" -lt 6 ]; then
        echo "Waiting 30 seconds... ($RUNNING/$TOTAL running)"
        sleep 30
    fi
done

echo ""
echo "6. Final status:"
kubectl get all -n desigo

echo ""
echo "📋 To access applications:"
echo "=========================="
echo ""
echo "Run port forwarding in separate terminals:"
kubectl port-forward -n desigo svc/storefront-service 8000:8000 &
echo "  → Storefront: http://localhost:8000"
echo ""
kubectl port-forward -n desigo svc/backend-service 9000:9000 &
echo "  → Backend API: http://localhost:9000"
echo ""
echo "Check logs if needed:"
echo "  kubectl logs -n desigo deployment/backend -f"
echo "  kubectl logs -n desigo deployment/storefront -f"
