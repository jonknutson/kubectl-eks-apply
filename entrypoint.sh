#!/bin/sh -l

echo "Fetching kubeconfig and setting the context"
aws eks update-kubeconfig --region $REGION --name $CLUSTER
CONTEXT=$(aws eks describe-cluster --region $REGION --name $CLUSTER | jq -r .cluster.arn)
kubectl config use-context $CONTEXT

echo "Applying the selected manifest files"
kubectl apply -f $1
