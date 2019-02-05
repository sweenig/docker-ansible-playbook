# Ansible Playbook Docker Image

Docker Image of Ansible for executing ansible-playbook command against an externally mounted set of Ansible playbooks. Based on [philm/ansible_playbook](https://github.com/philm/ansible_playbook)

## Build

```
docker build -t ansible-docker .
```

### Test

```
$ docker run --name ansible-docker --rm ansible-playbook --version

ansible-playbook 2.5.0
  config file = None
  configured module search path = [u'/ansible/library']
  ansible python module location = /usr/lib/python2.7/site-packages/ansible
  executable location = /usr/bin/ansible-playbook
  python version = 2.7.15 (default, Aug 16 2018, 14:17:09) [GCC 6.4.0]
```

## Running Ansible Playbook

```
docker run --rm -it -v PATH_TO_LOCAL_PLAYBOOKS_DIR:/ansible/playbooks ansible-docker PLAYBOOK_FILE
```

For example, assuming your project's structure follows [best practices](http://docs.ansible.com/ansible/playbooks_best_practices.html#directory-layout), the command to run ansible-playbook from the top-level directory would look like:

```
docker run --rm -it -v $(pwd):/ansible/playbooks ansible-docker site.yml
```

Ansible playbook variables can simply be added after the playbook name.

## SSH Keys

If Ansible is interacting with external machines, you'll need to mount an SSH key pair for the duration of the play:

```
docker run --rm -it \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
    -v $(pwd):/ansible/playbooks \
    ansible-docker site.yml
```

## Running in Windows
Add the following lines to your Powershell profile to make a function you can call directly:

```
function ansible-playbook {
  $allArgs = $PsBoundParameters.values + $args
  docker run --rm -it -v ${pwd}:/ansible/playbooks ansible-docker $allArgs
}
```