# kubectl-eks-apply
GitHub Action to run kubectl apply against an EKS cluster

This action gets the config for an EKS cluster and runs
kubectl with the provided parameters

It assumes you already have your AWS credentials set,
probably using the configure-aws-credentials action.

## Environment Variables
## `REGION`
**Required** The AWS region to use. Default `us-east-2`.

## `CLUSTER`
**Required** The name of your EKS cluster.

## Example usage
```
uses: jonknutson/kubectl-eks-apply
env:
  REGION: us-east-2
  CLUSTER: my-cluster
with:
  args: apply -f manifest_dir
```