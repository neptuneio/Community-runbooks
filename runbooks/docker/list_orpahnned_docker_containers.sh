#!/bin/bash
# Print current orphaned containers
echo "Orphan candidates:"
docker ps | egrep -v 'run-joe|run-gentle|ngin' | grep '\->' | egrep '^[0-9a-f ]{32}'
