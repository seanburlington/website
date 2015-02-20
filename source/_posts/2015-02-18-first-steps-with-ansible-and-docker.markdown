---
layout: post
title: "First Steps with Ansible and Docker"
date: 2015-02-18 14:04:59 +0000
comments: true
categories: Ansible Docker devops
---

I've been using puppet and vagrant for a while, due to client choices we're switching to ansible which I'm less familiar with - and Docker has been on my to learn list for a while.

I love vagrant - being able to bring up a VM locally that matches the production servers to a good degree is just brilliant, and being able to repeat deploys is invaluable in testing process.

The limitation with VMs is that each one takes a lot of resources, and is slow to build.

Linux containers are *much* lighter weight - being faster to create and using much less system resource to run, I'm hoping to be able to run more servers at once inside my laptop.

There is a nice quick demo of docker https://www.docker.com/tryit/

The steps below cover installing ansible and docker, building a simple docker image, and then using an ansible playbook to both create a container and then connect to that container. I just run a hello world at that point - but from there running any ansible code should be simple.



------------------------


On Ubuntu I installed the latest version via ppa following the notes from https://docs.docker.com/installation/ubuntulinux/

```bash 
# add the Docker repository key to your local keychain.
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
# Add the Docker repository to your apt sources list, update and install the lxc-docker package.
# You may receive a warning that the package isn't trusted. Answer yes to continue installation.

sudo sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker


# To verify that everything has worked as expected:

sudo docker run -i -t ubuntu /bin/bash

```

I also installed docker-py https://github.com/docker/docker-py

```bash
sudo pip install docker-py
```

This is required for the docker module in ansible which allows running docker commands from an ansible playbook, I probably don't need this right away - but later I want to be able to manage multiple docker containers on remote servers.

I installed ansible from git, following the instructions at http://docs.ansible.com/intro_installation.html#getting-ansible

```bash 

git clone git://github.com/ansible/ansible.git --recursive
cd ./ansible
source ./hacking/env-setup

#Ansible also uses the following Python modules that need to be installed:

sudo pip install paramiko PyYAML Jinja2 httplib2
```

Setup an Inventory file
```bash 
echo "localhost ansible_connection=local" > ~/ansible_hosts
export ANSIBLE_HOSTS=~/ansible_hosts
```

test with a ping command:
```bash
ansible all -m ping 
```

Those last steps are a slight variation on the official docs as I didn't want to use ssh locally - preferring the local connection which doesn't need passwords or keys to work, I'll come to that later.


I created a Dockerfile which builds me a base image that just has
 * sshd running
 * the ssh port exposed
 * ansible user added
 * passwordless sudo for ansible user
 * an authorised key for ansible user


The file is

```Dockerfile
# base
#
# VERSION               0.0.1

FROM centos:6
MAINTAINER Sean Burlington <sean@practicalweb.co.uk>

# setup sshd,  ensuring it runs through regular configs once - this does some initial setup
RUN yum -y update && yum -y install openssh-server
RUN service sshd start && service sshd stop

# create ansible user with sudo and public key
RUN yum -y install sudo
RUN useradd ansible
RUN echo 'ansible:D\N5Vlucg7,JlUhiDb<N' | chpasswd
ADD etc/sudoers/ansible /etc/sudoers.d/
RUN mkdir -p /home/ansible/.ssh/
ADD home/ansible/.ssh/authorized_keys /home/ansible/.ssh/
RUN chown -R ansible:ansible /home/ansible/ && chmod 700 /home/ansible/.ssh/ && chmod 600 /home/ansible/.ssh/authorized_keys


# set example env variable that will be visible in users shell
RUN echo "export VISIBLE=now" >> /etc/profile

# run sshd and expose it 
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

```

get this file and supporting code by

```bash 
git clone https://github.com/practicalweb/docker-ansible.git
cd docker-ansible
```

Note that I don't include my public key there (it is gitignored)

copy your by something like 
```bash
cp ~/.ssh/id_rsa.pub base-docker/home/ansible/.ssh/authorized_keys
```


build the image 
```
sudo docker build -t base base-docker/ 
```

I wrote a playbook that creates a container from the image, adds this host to the ansible inventory and then runs an ansible command to it

```YAML
# Docker / ansible hello world


# Create a a docker container on localhost (this has an ssh server in the image)
- hosts: localhost
  sudo: yes
  tasks:
  - name: start container 
    docker: image=base hostname=test name=test detach=False 

# add container(s) to the hosts inventory
  - name: add new hosts to inventory
    add_host: hostname="{{ item.Name }}"
      groups=docker
      ansible_ssh_host="{{ item.NetworkSettings.IPAddress }}"
      ansible_ssh_port=22
    when: item.State.Running == True
    with_items: docker_containers


# Now we can run ansible on the dockers container(s)
- hosts: docker
  sudo: yes
  remote_user: ansible
  tasks: 
    - name: hello
      shell: echo "hello world" 


```

run it like

```bash
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook  --ask-sudo-pass docker1.playbook
```

I turn off host key checking since this is a new host and will always fail


To clean up after creating containers - or you end up with lots of mess...

To stop all docker containers

```bash 
sudo docker stop $(sudo docker ps -a -q)
```

To remove all docker containers

```bash
sudo docker rm $(sudo docker ps -a -q)
```

Well now I can build a base image, create an instance of it as a container, and run ansible there.

Next steps are to run a more meaningful ansible playbook to setup my applications, and to link containers together so that apps can connect.



