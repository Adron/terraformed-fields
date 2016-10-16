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
    tar -czvf nodejs_application.tar.gz .
    mv nodejs_application.tar.gz ../terraform/nodejs_application.tar.gz
    echo "Application packaged."
}

timestamp

echo "Determining if new application deployment needed."

#if [ ! -f ../terraform/nodejs_application.tar.gz ]; then
#    echo "No application package. Now packaging app for new Terraform deployment."
#    cd ../nodejs
#
#    clean_and_install_nodejs
#
#    timestamp
#
#    package_application
#
#    timestamp
#    else
#    echo "Application package found. Will not repackage app. Delete nodejs_application.tar.gz to repackage application."
#fi