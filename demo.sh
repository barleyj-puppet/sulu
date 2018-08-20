source demomagic.sh
clear

PROMPT_TIMEOUT=0
pe 'kubectl get pods'
pe 'kubectl create -f k8s/pod.yml'
echo 'Login to Jenkins and show plugins'
pe 'kubectl logs example-pod example-service'
pe 'kubectl exec -it example-pod --container example-service -- ls -al /var/jenkins_home/plugins'
pe 'kubectl exec -it example-pod --container proxy -- ls -al /ssl-certs'
echo 'Login to Puppet and pin node'
pe 'kubectl exec -it example-pod --container puppet -- puppet agent -t --debug --verbose' || true
pe 'kubectl exec -it example-pod --container example-service -- ls -al /var/jenkins_home/plugins'
pe 'kubectl exec -it example-pod --container proxy -- ls -al /ssl-certs'
