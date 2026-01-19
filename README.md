# IaCPack: Production-Grade Amazon EKS Infrastructure

**IaCPack** is a robust Infrastructure as Code (IaC) project designed to automate the deployment and management of a production-ready **Amazon EKS (Elastic Kubernetes Service)** cluster. 

This repository serves as a blueprint for deploying scalable Kubernetes environments on AWS using **Terraform**, focusing on security, modularity, and high availability.

---

## 🚀 Key Features

* **Custom VPC Architecture:** Provisions a multi-AZ VPC with private and public subnets, NAT Gateways for secure outbound traffic, and required Kubernetes subnet tagging.
* **Managed Node Groups:** Implements AWS Managed Node Groups with Auto Scaling configurations to handle varying workloads and automated patching.
* **IAM Roles for Service Accounts (IRSA):** Configures OIDC Identity Providers to allow Kubernetes pods to assume fine-grained IAM roles (Principle of Least Privilege).
* **Security Orchestration:** Automated Security Group management for control plane-to-node and inter-node communication.
* **Modularity:** Clean separation of concerns between Networking (VPC), Identity (IAM), and Orchestration (EKS) modules.

---

## 🏗 High-Level Architecture

The infrastructure deployed via this project includes:
1.  **Network Layer:** A 3-tier VPC across multiple Availability Zones.
2.  **Control Plane:** A highly available EKS managed control plane.
3.  **Data Plane:** Private worker nodes isolated from the public internet for enhanced security.
4.  **Identity Layer:** OIDC integration for secure AWS resource access from within the cluster.

---

## 🛠 Tech Stack

* **Infrastructure:** Terraform (HCL)
* **Cloud Provider:** Amazon Web Services (AWS)
* **Orchestration:** Kubernetes / Amazon EKS
* **Tools:** kubectl, AWS CLI

---

## 💻 Getting Started

### Prerequisites
* [Terraform](https://www.terraform.io/downloads.html) v1.0+
* [AWS CLI](https://aws.amazon.com/cli/) installed and configured
* [kubectl](https://kubernetes.io/docs/tasks/tools/) installed

### Deployment Steps
1.  **Initialize the project:**
    ```bash
    terraform init
    ```
2.  **Review the execution plan:**
    ```bash
    terraform plan
    ```
3.  **Deploy infrastructure:**
    ```bash
    terraform apply
    ```
4.  **Configure kubectl:**
    ```bash
    aws eks update-kubeconfig --region <your-region> --name <cluster-name>
    ```

---

## 🔒 Security Best Practices
* **Private Subnets:** All worker nodes are placed in private subnets to prevent direct internet exposure.
* **State Management:** Designed to support remote backends (S3/DynamoDB) for state locking and team collaboration.
* **Least Privilege:** IAM policies are scoped strictly to the requirements of the EKS cluster and nodes.

---

## 📝 Author
**Prime2014**
* GitHub: [@prime2014](https://github.com/prime2014)