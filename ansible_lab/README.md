# Ansible Lab

This lab is designed to run completely in docker. There are two parts to the lab:

1. The target server(s) that our Ansible playbook will be inspecting
2. The server running our Ansible playbook

# Target Server(s)

Our target servers are simply Ubuntu servers, running an OpenSSH daemon. You can have one or more of these servers running. Just change the `replicas` line in the [docker-compose.yml](./docker-compose.yml) file and update the [inventory file](./inventory.yaml) to match.

To launch the target servers, simply navigate to the `ansible_lab` folder and execute `docker-compose up -d`

# Ansible Playbook Runner
You can choose to build this container locally since its Dockerfile is included in this repo, or you can just `docker pull sweenig/ansible-docker`. If you choose to build it locally, run the following from the `ansible_lab` folder:

`docker build -t sweenig/ansible-docker ..\.`

Whether you pull it or build it locally, using it is the same. From the `ansible_lab` folder, execute:

`docker run --rm -v ${PWD}:/ansible/playbooks --network=ansible_lab_default sweenig/ansible-docker playbook.yml -i inventory`
