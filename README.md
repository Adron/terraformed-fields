# Multi-Cloud Deployment Demo

A multi-cloud deployed node.js application.

# Workshop Notes

Here are the notes from the Wednesday, October 19th, 2016 Workshop in London at O'Reilly Software Architecture Conference.

```shell-script
npm install express -g
npm install express-generator -g
express .
npm install
npm start
navigate http://localhost:3000
```
---
```shell-script
git init
git remote add origin git@repo.path.here  https://whatever
git remote rm origin
git push -u origin master
```
---
```shell-script
# Setup commands
nvm install 4.6.1
npm install
# Test commands
npm test
```
---
```shell-script
# Create directory called 'test'
npm install mocha --save
# Get unit test from mochajs.org
# Add to git repo
git push origin master
# Add the script for tests to package.json
  "test": "mocha"
```
---
Terraform & Packer
https://www.terraform.io
https://www.packer.io

Terraform Installation
https://www.terraform.io/intro/getting-started/install.html
Packer Installation
https://www.packer.io/docs/installation.html
