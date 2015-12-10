# Step 1: Check for current disk space utilization
df -h

# Step 2: Find few largest files in logs directory which could be causing the fill up
echo ""
du -ah /var/log/ 2>/dev/null | sort -nr | head

# To check the disk usage based on time
# du -ah --time /var/log/ 2>/dev/null

# Step3 : Check for /tmp and /cache files
if [ -d "/tmp" ]; then
    echo ""
    du -ah /tmp 2>/dev/null | sort -nr | head
    echo ""
    df -h /tmp
fi

if [ -d "/cache" ]; then
    echo ""
    du -ah /cache 2>/dev/null | sort -nr | head
    echo ""
    df -h /cache
fi
