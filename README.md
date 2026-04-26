terraform
│
├── main.tf                 # Calls modules: module "vpc" { source = ... }
├── variables.tf            # Root input declarations
├── outputs.tf              # Root outputs (VM Public IP)
├── terraform.tfvars        # REAL DATA (vpc_cidr = "10.0.0.0/16")
│
└── modules/
    ├── vpc/
    │   ├── main.tf         # VPC, Subnets, IGW, NAT logic
    │   ├── variables.tf    # vpc_cidr, pub_cidr definitions
    │   └── outputs.tf      # output "vpc_id" { value = ... }
    │
    ├── ec2/
    │   ├── main.tf         # Instance & Security Group logic
    │   ├── variables.tf    # ami, vpc_id, subnet_id definitions
    │   └── outputs.tf      # output "instance_ip" { value = ... }
    │
    └── s3/
        ├── main.tf         # S3 Bucket & Policy logic
        ├── variables.tf    # bucket_name definitions
        └── outputs.tf      # output "bucket_arn" { value = ... }

$ terraform init
$ terraform plan
$ terrafrom apply

-> Ansible
-> install ansible.sh
$ ssh-keygen -t rsa     #in master node
$ ssh-copy-id username@worker_ip_address  # do this in master node, to configure/communicate with worker node
$ sudo nano /etc/ansible/hosts  # in master node
-> add this

[workers]
worker1 ansible_host=192.168.1.10
worker2 ansible_host=192.168.1.11

[all:vars]
ansible_user=your_ssh_username #masternode username(ubuntu)

-> (or) add this     

[webservers]
192.168.1.10
192.168.1.11

[dbservers]
192.168.1.50

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/id_rsa
              

$ ansible all -m ping

Ansible Tree


devops-project/
├── ansible.cfg                # Settings: user, inventory location, etc.
├── inventory.ini              # Defines which worker is which
├── site.yml                   # The "Bridge" connecting nodes to roles
└── roles/
    ├── docker_sonar/          # Group 1: SonarQube Logic
    │   └── tasks/
    │       └── main.yml
    └── cicd_tools/            # Group 2: Jenkins/Maven/Trivy Logic
        └── tasks/
            └── main.yml




 

        
