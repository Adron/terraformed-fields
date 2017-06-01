{
  "type": "googlecompute",
  "account_file": "{{user `account_json`}}",
  "project_id": "that-big-universe",
  "source_image": "debian-8-jessie-v20160923",
  "zone": "us-west1-a",
  "instance_name": "{{user `instance_name`}}",
  "image_name": "{{user `image_name`}}",
  "image_description": "{{user `image_description`}}",
  "communicator": "ssh",
  "ssh_username": "broodadmin"
},
