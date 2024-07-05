## EC2 Instance Setup with Jenkins and Docker

This guide provides detailed steps to set up an AWS EC2 instance with Jenkins and Docker for continuous integration and deployment.

## Prerequisites

- AWS Account
- AWS CLI configured
- EC2 instance (preferably Ubuntu)

## Steps

### 1. Update and Upgrade the System

First, update and upgrade the system packages:

```bash
sudo apt update
sudo apt-get update
sudo apt upgrade -y

```

### 2. Install Docker

Download and install Docker:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker


```

### 3. Install AWS CLI

Install the AWS Command Line Interface (CLI):

```bash
sudo apt install awscli -y
```

Configure AWS CLI with your credentials:

```bash
aws configure
```

### 4. Install Java and Jenkins

Install OpenJDK 8:

```bash
sudo apt update
sudo apt install openjdk-8-jdk -y
```

This is the Debian package repository of Jenkins to automate installation and upgrade:

```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

```

Then add a Jenkins apt repository entry:

```bash
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
```

Update your local package index, then finally install Jenkins:

```bash
sudo apt-get update
sudo apt-get install fontconfig openjdk-17-jre
sudo apt-get install jenkins
```

### 5. Start and Enable Jenkins

Start and enable the Jenkins service:

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins

```

Check the Jenkins service status:

```bash
sudo systemctl status jenkins
```

### 6. Configure Jenkins with Docker

Add Jenkins user to the Docker group:

```bash
sudo usermod -aG docker jenkins
newgrp docker
```

### 7. Retrieve Jenkins Admin Password

Get the initial admin password for Jenkins setup:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Use this password to unlock Jenkins at http://<your-ec2-public-ip>:8080.


### AWS Elastic IP Setup
Assign an Elastic IP to your EC2 instance to ensure it has a static public IP address. Follow these steps:

- Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.
- In the navigation pane, choose Elastic IPs.
- Choose Allocate new address and then Allocate.
- Select the newly allocated Elastic IP address, choose Actions, and then Associate address.
- Select your instance from the list and associate the Elastic IP.