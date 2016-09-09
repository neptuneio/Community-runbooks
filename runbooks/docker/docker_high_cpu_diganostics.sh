# High load runbook

# Step 1: diagnose high-CPU containers
echo "`docker-profile cpu` results:"
docker-profile cpu
