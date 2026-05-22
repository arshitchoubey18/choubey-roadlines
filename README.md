# Choubey Roadlines - DevOps Capstone

Production-grade web app for Indian transport company.

## Stack
- Frontend: Pure HTML/CSS/JS (nginx)
- Container: Docker
- Orchestration: Kubernetes (EKS)
- IaC: Terraform
- CI/CD: GitHub Actions
- Monitoring: Prometheus + Grafana
- Logging: Loki

## Quick Start
1. Copy web files to ./web/
2. docker-compose up
3. Visit http://localhost:8080

## Capstone Flow
Code → GitHub → Actions (lint, build, scan) → ECR → EKS deploy → Prometheus alerts
