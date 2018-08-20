# sulu

POC to demonstrate using Puppet agent's as a side car for configuring servies.

To use, edit k8s/puppet-service.yml and change the externalName to point to the FQDN of your puppet master. Then use kubectl to add the configs for puppet-service, python-service and python-pod. 
