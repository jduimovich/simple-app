 
TOKEN=$(oc whoami --show-token)
SERVER=$(oc whoami --show-server )

gh secret set OPENSHIFT_SERVER -b $SERVER
gh secret set OPENSHIFT_TOKEN -b $TOKEN
if [ -z $MY_DOCKER_PW ]
then
echo "\n" $0: No MY_DOCKER_PW set, please set MY_DOCKER_PW to your registry password.
echo "\n" $0: This registry must match the registry (docker.io or quay.io you have set in the OpenShift Workflow)
exit
else 
gh secret set REGISTRY_PASSWORD -b $MY_DOCKER_PW
fi