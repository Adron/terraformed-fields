# Multi-Cloud Deployment Demo

[ ![Codeship Status for Adron/multi-cloud](https://app.codeship.com/projects/d4418b20-755c-0134-101b-1eaf12e437c5/status?branch=master)](https://app.codeship.com/projects/179369)

A multi-cloud deployed node.js application.

To work with or develop the application into something that is more than merely just a Hello World style app, here are some starting points.

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
