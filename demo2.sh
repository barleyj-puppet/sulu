source demomagic.sh
clear

PROMPT_TIMEOUT=0
pe 'kubectl get pods'
pe 'kubectl create -f k8s/python_pod.yml'
pe 'kubectl logs python-pod python-service'
pe 'kubectl exec -it python-pod --container proxy -- ls -al /etc/nginx/certs'
pe 'kubectl exec -it python-pod --container python-service -- ls -al /app/conf'
pe 'kubectl exec -it python-pod --container puppet -- puppet agent -t --debug --verbose' || true
pe 'kubectl exec -it python-pod --container proxy -- ls -al /etc/nginx/certs'
echo 'Connect to service'
read -p "Continue? " -n 1 -r
pe 'kubectl exec -it python-pod --container python-service -- ls -al /app/conf'
echo 'Pin node to Database'
read -p "Continue? " -n 1 -r
pe 'kubectl exec -it python-pod --container puppet -- puppet agent -t --debug --verbose' || true
pe 'kubectl exec -it python-pod --container python-service -- ls -al /app/conf'
echo 'Connect to service'
