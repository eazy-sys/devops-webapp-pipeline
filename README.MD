# Secure Netflix Web App on Azure

## Overview

This project showcases the end-to-end deployment of a **secure, containerized Netflix-like web application** on Microsoft Azure using a fully automated DevSecOps pipeline. The project evolved from infrastructure provisioning using Terraform to full-scale application deployment on AKS (Azure Kubernetes Service) with observability and security tools integrated.

## Project Objectives

* Deploy a scalable, secure web app on AKS
* Automate infrastructure and application lifecycle using Terraform and GitHub Actions
* Ensure observability via Prometheus and Grafana
* Integrate security scanning (Trivy and SonarCloud)
* Configure email alerting using SMTP
* Follow modular, reusable, and production-grade infrastructure patterns with DevSecOps principles

---

## Tools & Technologies Used

* **Azure Kubernetes Service (AKS)**: Orchestrates containerized workloads
* **Azure Container Registry (ACR)**: Hosts Docker images securely
* **Terraform**: Infrastructure as Code (IaC) for automating Azure resource provisioning
* **GitHub Actions**: CI/CD automation pipeline
* **Docker**: Containerizes the Netflix web app
* **Kubernetes**: Manages deployments, services, and scaling
* **Prometheus**: Metrics collection and monitoring
* **Grafana**: Visualization of application and infrastructure metrics
* **SonarCloud**: Static code analysis for maintainability and security
* **Trivy**: Container vulnerability scanner integrated into the pipeline
* **SMTP Email Alerts**: Sends real-time alerts for critical events or failures in the pipeline or cluster

---

## Terraform Modularization

To enhance reusability and clarity, the infrastructure was split into well-defined modules:

* **Resource Group Module**: Encapsulates location and tagging logic
* **AKS Module**: Configures node pools, RBAC, networking, and monitoring integration
* **ACR Module**: Creates Azure Container Registry with appropriate access policies
* **Networking Module**: Manages VNet and subnet allocations



**Why Modularize?**

* Encourages **code reuse** across environments
* Simplifies **testing and maintenance**
* Supports **versioning** and collaborative development
* Keeps **main.tf** clean and focused on orchestration

---

## CI/CD Pipeline Design (GitHub Actions)

The pipeline was structured in stages:

1. **Build**: On push to `main`, Docker image is built
2. **Test**: Run linting/unit tests and SonarCloud static analysis
3. **Scan**: Trivy scans the Docker image for known vulnerabilities
4. **Push**: Docker image is pushed to ACR
5. **Deploy**: Kubernetes manifests are applied to AKS
6. **Alert**: SMTP integration sends notifications on pipeline failures or post-deployment issues
7. **SonarCloud**: Static code analysis for maintainability and security

**Why GitHub Actions?**

* Seamless integration with GitHub repository
* Easily customizable YAML workflows
* Supports secrets and environment variables
* Cost-effective and scalable

---

## Observability & Monitoring

* **Prometheus** was installed via Helm for metrics collection
* **Grafana** was configured with Azure Monitor and Prometheus as data sources
* Custom dashboards were created to monitor:

  * CPU/Memory usage
  * Pod status
  * Request rate and errors

---

## Security Practices

* **Trivy** scans Docker images during CI for vulnerabilities
* **SonarCloud** integrated for static code analysis
* SMTP email alerts configured for critical security or availability events
* AKS configured with **RBAC**, **network policies**, and **private ACR access**

---

## Key Learnings

* Mastery of **Terraform modules** and Azure provider setup
* Deep understanding of **AKS cluster internals** and Helm deployments
* Real-world use of **CI/CD pipelines** and **GitOps practices**
* Hands-on with **DevSecOps** tooling and workflows for secure delivery
* Advanced skills in **observability**, **incident response**, and **automation**

---

## Final Notes

This project simulates real-world DevSecOps work—balancing development, infrastructure, automation, security, and visibility. It reflects production readiness, IaC maturity, and continuous security integration.

> This README serves as both a technical summary and a personal learning journal of building a secure, observable, and scalable web app on Azure using DevSecOps best practices.
