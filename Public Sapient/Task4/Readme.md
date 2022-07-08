Expose the hello world pod to access over internel using load balancer using kubectl with service yaml file

set the kubernetes cluster context using the commad below

kubectl config use-context ${cluster config name/ arn of the eks cluster}

Create the service load balancer using command below

kubectl apply -f service.yaml

To list the service and get the endpoint of the load balancer use the command below

kubectl get svc -n ${name of the namespace}
