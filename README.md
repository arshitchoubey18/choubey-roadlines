# 🚚 Choubey Roadlines — Cloud-Native Logistics Platform

[![Live Demo](https://img.shields.io/badge/LIVE-arshitchoubey18.github.io-green?style=for-the-badge&logo=github)](https://arshitchoubey18.github.io/choubey-roadlines/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue?style=for-the-badge&logo=docker)](./Dockerfile)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=for-the-badge&logo=kubernetes)](./k8s)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?style=for-the-badge&logo=terraform)](./terraform)

> **From phone bookings to production-grade DevOps in 1 repo.**
> A full-stack DevOps capstone that takes a traditional Indian transport company and ships it like a tech startup.

### 🌐 Live: https://arshitchoubey18.github.io/choubey-roadlines/

---

## The Story

Choubey Roadlines has run 500+ trucks across 28 states since 1998 — but bookings were on the phone, and tracking was on WhatsApp.

I rebuilt it as a cloud-native product:

1. Designed a mobile-first logistics website
2. Containerized it
3. Automated everything from `git push` to production with GitHub Actions, Terraform, and Kubernetes

**Result:** Any commit goes live in <60 seconds on GitHub Pages and is ready to deploy to AWS EKS with zero manual steps.

---

---

## 🏗️ Architecture

Developer → GitHub Push  
↓  
[GitHub Actions CI/CD]  
├── Lint → Build Docker → Trivy Scan → Push to ECR  
└── Deploy `./web` → GitHub Pages (LIVE)  
↓  
[AWS - Terraform]  
VPC → EKS Cluster → Node Group → Load Balancer  
↓  
Deployment (3 replicas) → HPA (3–10 pods) → Service → Ingress  
↓  
[Observability - Ready]  
Prometheus + Grafana + Loki  
↓  
[Kubernetes]

---

## 🔧 DevOps Implementation

### 1. CI/CD (GitHub Actions)

**File:** `.github/workflows/`

- **pages.yml** — Deploys the static site to GitHub Pages on every push to `main`
- **ci-cd.yml** — Full pipeline: HTML lint → Docker build → Trivy vulnerability scan → Push to Amazon ECR → Deploy to EKS

### 2. Containerization

- `Dockerfile` based on `nginx:alpine` (23MB)
- Health check built in
- Multi-stage ready for backend

### 3. Infrastructure as Code

**File:** `terraform/`

- VPC with 2 AZs in Mumbai (`ap-south-1`)
- EKS cluster + managed node group
- ECR repository
- 100% `terraform plan/apply` — no click-ops

### 4. Kubernetes

**File:** `k8s/`

- Deployment with 3 replicas
- Rolling updates (zero downtime)
- HPA for auto-scaling
- Namespace isolation (`production`)

### 5. Local Dev Experience
```
docker-compose up -d --build
# → http://localhost:8080
```
🛠️ Tech Stack
```
Layer	Tool
Frontend	Vanilla HTML5, CSS3, JS (no framework)
Web Server	Nginx Alpine
Container	Docker & Docker Compose
CI/CD	GitHub Actions
IaC	Terraform
Orchestration	Kubernetes (AWS EKS)
Registry	Amazon ECR
Monitoring*	Prometheus, Grafana, Loki
Hosting	GitHub Pages (now), EKS (prod-ready)

*Configs included.
```
🚀 Quick Start
```
# 1. Clone
git clone https://github.com/arshitchoubey18/choubey-roadlines.git
cd choubey-roadlines

# 2. Run locally
docker-compose up -d --build

# 3. Open
http://localhost:8080

Push to main → site auto-deploys to Pages in ~40 seconds.
```

📁 Project Structure
```
.
├── web/                    # Static website
├── Dockerfile              # Production image
├── docker-compose.yml      # Local development
├── .github/workflows/      # CI/CD pipelines
│   ├── pages.yml           # GitHub Pages deployment
│   └── ci-cd.yml           # AWS deployment
├── k8s/                    # Kubernetes manifests
├── terraform/              # AWS infrastructure
└── README.md
```
🎯 What I Learned
```
Building production pipelines, not just code
Security-first approach: Trivy scans in CI
GitOps: infrastructure and application versioned together
Cost-aware design: Alpine images, HPA, spot-ready nodes
```
🗺️ Roadmap
```
Backend API (Node.js + PostgreSQL) for real tracking
Custom domain + CloudFront CDN
Full monitoring stack deployment
ArgoCD for GitOps
```
👨‍💻 Author

Arshit Choubey — DevOps Engineer | Bangalore

GitHub: @arshitchoubey18

Project: Capstone for Cloud & DevOps

Built to prove that I can take a legacy business and ship it like a startup.
