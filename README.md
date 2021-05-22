# redteam-elk-stack
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![image of REDTEAMnetwork.png](https://github.com/rtificial-flava/redteam-elk-stack/blob/main/Diagrams/images/RED%20TEAM%20network.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the my-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

  [Link to my-playbook.yml](https://github.com/rtificial-flava/redteam-elk-stack/blob/main/Ansible/my-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting access to the network.
- Load Balancers protect the network from DDoS Attacks by distributing the incoming traffic. A jump box focuses the network connections to one point making it easier to monitor.  Also adds the ability to install/deploy containers to virtual machines connected in the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Network and system files.
- Filebeat monitors and collects log files on your network system.
- Metricbeat monitors metrics of the operating system and services running on the servers.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    | Webserver| 10.0.0.5   | Linux            |
| Web-2    | Webserver| 10.0.0.6   | Linux            |
| Web-3    | Webserver| 10.0.0.7   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 92.119.18.218

Machines within the network can only be accessed by SSH.
- The RedTeam-ELKmachine virtual machine is only accessible from the Jump-box virtual machine at IP address: 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 10.0.0.4, 92.119.18.218, 92.119.18.42   |
| Web-1    | No                  | 10.0.0.4             |
| Web-2    | No                  | 10.0.0.4             |
| Web-3    | No                  | 10.0.0.4             |
| RedTeam-ELKmachine | Yes       | 92.119.18.218        |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because with ansible you can deploy and configure a system quickly and effectiently.  Ansible automation can be deployed on one or countless other machines at the same time.


The playbook implements the following tasks:
- Installs Docker.io, Python3, and the docker module
- Increases virtual memory
- Downloads and Installs the ELK Stack container
- Sets the ports the ELK Stack runs on

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![dockerscreenshot](https://github.com/rtificial-flava/redteam-elk-stack/blob/main/Diagrams/images/docker%20screen%20shot.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 IP: 10.0.0.5, Web-2 IP: 10.0.0.6, Web-3 IP: 10.0.0.7

We have installed the following Beats on these machines:
- Filebeats and Metricbeats

These Beats allow us to collect the following information from each machine:
- Filebeat collects logs from the 3 virtual machines and can track various activity for each. Metricbeat collects status info for each virtual machine, so we can monitor the state of each machine.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/hosts
- Update the hosts file to include private IPs of all the virtual machines and user name of each.
- Run the playbook, and navigate to 92.119.18.218
:5601/app/kibana to check that the installation worked as expected.

#### Setup walk through
##### Installing docker in the terminal
run each command in the terminal in the order posted
`sudo apt update`
`sudo apt install docker.io`
`sudo systemctl status docker`
`sudo docker pull cyberxsecurity/ansible`
`docker run -ti cyberxsecurity/ansible:latest`
