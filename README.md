# kubectl-eks-apply
GitHub Action to run kubectl apply against an EKS cluster

This action gets the config for an EKS cluster and runs
kubectl with the provided parameters

It assumes you already have your AWS credentials set,
probably using the configure-aws-credentials action.

## Environment Variables
## `REGION`
**Required** The AWS region in which your cluster lives.

## `CLUSTER`
**Required** The name of the cluster against which to authenticate.

## Inputs
## `kubectl-command`
**Required** The subcommand and arguments to pass to kubectl.

## Example usage
Connect to cluster named `xyzdemo` in `us-east-2`.
Run all of the manifests in a directory named `k8s-config`
```
  - name: Apply Kubernetes Manifests
    uses: jonknutson/kubectl-eks-apply@v2.1.2
    env:
      REGION: us-east-2
      CLUSTER: xyzdemo
    with:
      kubectl-command: apply -f ./k8s-config
```