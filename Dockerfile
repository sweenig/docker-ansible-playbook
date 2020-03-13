FROM ubuntu:19.04

RUN apt update
RUN apt upgrade -y
RUN apt install software-properties-common -y
RUN apt-add-repository ppa:ansible/ansible -y
RUN apt update
RUN apt install ansible -y
RUN apt install python -y
RUN mkdir -p /ansible/playbooks

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
