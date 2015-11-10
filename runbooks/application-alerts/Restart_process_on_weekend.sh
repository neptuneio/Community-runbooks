# Runbook to take different actions based on if it's a weekday or weekend.

# Capture the top memory and CPU consumers by default.

# Step1: Capture top 10 cpu hogs on the host
ps -eo pcpu,pid,user,args | sort -k 1 -r | head

# Step2: Capture top 10 memory hogs on the host
ps aux |sort -nrk 4 |head

if [[ $(date +%u) -gt 5 ]]
then
    # It's a weekend so go ahead and restart the process.
    echo 'Restarting the process since it is a weekend.';

    # TODO: Command to restart the process goes here.
else
    # It's a weekday so take more diagnostics and escalate instead of restarting the process.
    echo 'It is a weekday so taking more diagnostics.';

    # TODO: More commands go here.
fi