Deploy the hello world image into kubernetes cluster using kubectl with deployment yaml

set the kubernetes cluster context using the commad below

kubectl config use-context <cluster config name/ arn of the eks cluster>

deploy the hello world image into kubernetes cluster using command below

kubectl apply -f deployment.yaml

to list the pods use command below

kubectl get pods -n <name of the namespace>