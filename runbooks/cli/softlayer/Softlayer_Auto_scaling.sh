# Softlayer Auto-scale Runbook

# Step1: Check number of softlayer virtual servers running
echo "Checking Softlayer virtual server count"
echo "---------------------------------------"
slcli vs list

# Step2 : Scale up virtual servers with a tag name
TAG="tag_name_here"

echo "Scaling up virtual servers in tag $TAG"
echo "--------------------------------------"
slcli vs create --hostname=example --domain=softlayer.com --cpu 2 --memory 1024 -o UBUNTU_14_64 --datacenter=sjc01 --billing=hourly -tag $TAG

# Step3 : OR Scale down virtual servers
echo "Scaling down virtual servers with a minimum of 2 virtual servers"
echo "--------------------------------------"
servers_count=$(slcli vs list | grep "Assign Host" | wc -l)
# Maintain a minimum of 2 virtual servers
if [ "$servers_count" -gt 2 ]
then
    slcli vs cancel <count_of_servers_to_cancel, eg: 5> -tag $TAG
  # If required scale down to particular server count at once
  # slcli vs cancel down to <2>
fi

# Step4: Wait for 60 seconds to check if scaling up/down is successful
echo "Checking number of virtual servers"
echo "----------------------------------"
sleep 60
slcli vs list

# Above commands are just a sample of what you can do with Softlayer CLI. 
# Use 'slcli help' or refer to http://softlayer-api-python-client.readthedocs.org/en/latest/cli/#usage-examples for more info
