FROM ubuntu:latest

RUN apt update && \
apt upgrade -y && \
apt install software-properties-common -y && \
apt-add-repository ppa:ansible/ansible -y && \
apt update && \
apt install ansible -y && \
apt install python3 -y && \
mkdir -p /ansible/playbooks

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PYTHONPATH /ansible/lib
ENV PATH /ansible/bin:$PATH
ENV ANSIBLE_LIBRARY /ansible/library

WORKDIR /ansible/playbooks

ENTRYPOINT ["ansible-playbook"]
