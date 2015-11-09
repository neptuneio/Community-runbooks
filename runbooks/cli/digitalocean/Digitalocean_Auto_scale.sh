# ALERT : Queue size high alert from any monitoring tool
# Digital ocean Auto-scale Runbook

# Step1: Check number of Digital ocean droplets running in a region of interest
echo "Checking Digital ocean droplets count"
echo "-------------------------------------"
tugboat droplets

# Step2 : Create more droplets
echo "Scaling up droplets"
echo "-------------------"
tugboat create app-www-002 -s 512mb -i ubuntu-12-04-x64 -r nyc2 -k 11251

# Step3 : Scale down droplets maintaining a minimum of 1 worker dyno
echo "Scaling down droplets"
echo "---------------------"
droplets_count=$(tugboat droplets | wc -l)
# Maintain a minimum of 2 droplets
if [ "$droplets_count" -gt 2 ]
then
  tugboat destroy pearkes-www-002
  # If required scale down to particular droplet count at once if tugboat CLI supports such a command
  # tugboat destroy .....
fi

# Step4: Wait for 60 seconds to check if scaling up/down is successful
echo "Checking Digital ocean droplets"
echo "--------------------"
sleep 60
tugboat droplets


# Above commands are just a sample of what you can do with tugboat CLI. Use 'tugboat help' or refer to https://github.com/pearkes/tugboat for more tugboat commands
