#!/usr/bin/env bash

timestamp() {
    date +"%T"
}

clean_and_install_nodejs(){
    timestamp
    echo "Cleaning Node.js Dependencies."
    sudo rm -rf node_modules
    npm install
    echo "Cleaned up and reinstalled node dependencies."
}

package_application() {
    echo "Zipping up application with dependencies."
    cd ../../
    tar -zcvf  brood_application.tar.gz \
     bin public routes views app.js package.json
    mv brood_application.tar.gz ecosystem/terraform/brood_application.tar.gz
    cd ecosystem/terraform
    echo "Application packaged."
}

timestamp

echo "Determining if new application deployment needed."

if [ ! -f ../terraform/brood_application.tar.gz ]; then
    echo "No application package. Now packaging brood for new Terraform deployment."

    echo "Finished."
    timestamp
    else
    echo "Application package found. Will not repackage app. Delete brood_application.tar.gz to repackage application.
fi