#!/bin/bash

# Step 1: Cleanup old Helm releases if they exist
helm uninstall prometheus -n monitoring || true
helm uninstall grafana -n monitoring || true
helm uninstall kube-prometheus-stack -n monitoring || true
kubectl delete namespace monitoring --ignore-not-found=true

# Step 2: Install required CRDs
echo "Installing required CRDs..."
kubectl apply -f https://github.com/prometheus-operator/prometheus-operator/releases/download/v0.70.0/bundle.yaml

# Wait for CRDs to settle
echo "Waiting 15 seconds for CRDs to finish installing..."
sleep 15

# Step 3: Add Helm repos (if not already added)
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Step 4: Install kube-prometheus-stack with LoadBalancer for Prometheus and Grafana
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  --set prometheus.service.type=LoadBalancer \
  --set grafana.service.type=LoadBalancer \
  --set grafana.adminPassword='admin123'

echo "Installation started. Use the commands below to get LoadBalancer IPs:"

echo ""
echo "Grafana:"
echo "kubectl get svc -n monitoring kube-prometheus-stack-grafana"
echo ""
echo "Prometheus:"
echo "kubectl get svc -n monitoring kube-prometheus-stack-prometheus"
