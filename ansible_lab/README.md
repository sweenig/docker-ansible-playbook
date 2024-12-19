# Ansible Lab

This lab is designed to run completely in docker. There are two parts to the lab:

1. The target server(s) that our Ansible playbook will be inspecting
2. The server running our Ansible playbook

## Downloading these files

You can use Git to download this entire repository to your local computer. In a terminal in a folder where you want to download the files:

Windows

`docker run -it --rm -v ${HOME}:/root -v ${PWD}:/git alpine/git clone https://github.com/sweenig/docker-ansible-playbook.git`

Linux/Mac is just as easy:

`docker run -it --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/sweenig/docker-ansible-playbook.git`

This will create a folder called `docker-ansible-playbook` containing all the files from this repository.

## 401 Unauthorized

Docker hub contains many wonderful images. However, they require that you be authenticated. Go sign up for an account, then issue `docker login` to log your terminal into Docker hub. This should allow you to pull down images.

## Target Server(s)

Our target servers are simply Ubuntu servers, running an OpenSSH daemon. You can have one or more of these servers running. Just change the `replicas` line in the [docker-compose.yml](./docker-compose.yml) file and update the [inventory file](./inventory.yaml) to match.

To launch the target servers, simply navigate to the `ansible_lab` folder and execute `docker-compose up -d`

If you have issues running `docker-compose` replace the - with a space like this: `docker compose up -d`

## Ansible Playbook Runner

You can choose to build this container locally since its Dockerfile is included in this repo, or you can just `docker pull sweenig/ansible-docker`. If you choose to build it locally, run the following from the `ansible_lab` folder:

`docker build -t sweenig/ansible-docker ..\.`

Whether you pull it or build it locally, using it is the same. From the `ansible_lab` folder, execute:

`docker run --rm -v ${PWD}:/ansible/playbooks --network=ansible_lab_default sweenig/ansible-docker playbook.yml -i inventory`
