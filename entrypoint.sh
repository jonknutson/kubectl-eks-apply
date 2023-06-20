#!/bin/sh -l

echo "Fetching kubeconfig from EKS cluster '$CLUSTER' in AWS region '$REGION' and setting the kubectl context."
aws eks update-kubeconfig --region $REGION --name $CLUSTER
CONTEXT=$(aws eks describe-cluster --region $REGION --name $CLUSTER | jq -r .cluster.arn)
kubectl config use-context $CONTEXT

echo "Running kubectl $1:"
kubectl $1
