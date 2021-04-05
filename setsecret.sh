 
TOKEN=$(oc whoami --show-token)
SERVER=$(oc whoami --show-server )

gh secret set OPENSHIFT_SERVER -b $SERVER
gh secret set OPENSHIFT_TOKEN -b $TOKEN
if [ -z $MY_QUAY_PW ]
then
echo  $0: No MY_QUAY_PW set, please set MY_QUAY_PW to your registry password.
exit
else 
gh secret set REGISTRY_PASSWORD -b $MY_QUAY_PW
fi