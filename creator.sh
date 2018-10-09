# Only run this script if the environment needs to be recreated entirely, state management
# and all. This should only be run after the destroy.sh or related destruction process has
# been followed to remove all of the respective resources.

#!/usr/bin/env bash

BUCKET_NAME="all-the-things-storage"

cd state
terraform init
echo "yes" | terraform apply

cd ..

echo "yes" | terraform init
echo "yes" | terraform apply