## CI/CD Pipeline with Docker & Kubernetes
This project demonstrates an end-to-end CI/CD pipeline that automates the build, containerization, and deployment of a Node.js application using GitHub Actions, Docker, Docker Hub, and Kubernetes.<br>
The pipeline follows real-world DevOps practices, including versioned Docker images and Kubernetes rolling deployments.

------

## Project Overview
The goal of this project is to implement a reliable CI/CD workflow where:<br>
  - Code changes automatically trigger a CI pipeline<br>
  - A Docker image is built and pushed to Docker Hub<br>
  - Kubernetes deploys the new image using rolling updates<br>
  - The application remains available during deployment<br>
  - This project focuses on clarity, correctness, and production-style workflows, not shortcuts.<br>

------

## Tech Stack 
- Node.js – Backend application<br>
- Docker – Containerization<br>
- Docker Hub – Container image registry<br>
- GitHub Actions – CI automation<br>
- Kubernetes (Minikube) – Container orchestration<br>
- kubectl – Kubernetes management<br>

------

## Project Structure 📂
```text
  cicd-k8s-project/
  │
  ├── index.js                 # Node.js application
  ├── package.json
  ├── Dockerfile               # Docker image definition
  │
  ├── k8s/
  │   ├── deployment.yaml      # Kubernetes Deployment
  │   └── service.yaml         # Kubernetes Service
  │
  └── .github/
      └── workflows/
          └── deploy.yml       # GitHub Actions CI workflow
```
------

## Application Overview 🔄
- A simple Node.js web server<br>
- Listens on port 3000<br>
- Configured to bind to 0.0.0.0 for Kubernetes compatibility<br>

------

## Continuous Integration (CI)
The CI pipeline is implemented using GitHub Actions and runs automatically on every push to the main branch.

**CI Workflow:-**
  - GitHub Actions checks out the repository<br>
  - Logs in to Docker Hub using GitHub Secrets<br>
  - Builds a Docker image<br>
  - Tags the image using the commit SHA<br>
  - Pushes the image to Docker Hub<br>

**Why Commit-SHA Image Tags?**<br>
  - Avoids Docker image caching issues<br>
  - Makes deployments traceable<br>
  - Ensures Kubernetes always deploys a new version<br>
  - Industry best practice (avoids latest tag problems)<br>

**Example image tag:**<br>
      janhvigupta29/cicd-k8s-project:7b3e7bff33d13836eec264da17af095ace67f2c

------

## Continuous Deployment (CD)
After a successful CI build, the application is deployed to a Kubernetes cluster using a rolling update strategy.

**CD Workflow:-**
  - CI produces a versioned Docker image<br>
  - Kubernetes deployment is updated to use the new image<br>
  - Kubernetes performs a rolling update<br>
  - Old pods are terminated gradually while new pods are created<br>
  - Application remains available during deployment<br>

**Key Deployment Commands**<br>
kubectl set image deployment/cicd-app app=janhvigupta29/cicd-k8s-project:<commit-sha><br>
kubectl rollout status deployment cicd-app<br>
kubectl scale deployment cicd-app --replicas=2<br>

**Deployment Features**
  - Versioned Docker images<br>
  - Rolling updates with zero downtime<br>
  - Clear separation of CI (build) and CD (deploy)<br>
  - Deployment verification via image tags<br>

-----

## Kubernetes Resources

**Deployment:-**
  - Manages application pods<br>
  - Uses rolling update strategy<br>
  - Scales replicas as required<br>
  
**Service:-**
  - Exposes the application internally<br>
  - Allows access via Minikube service tunnel<br>

-----

## Verification & Debugging

Deployment success is verified by:-<br>
  - Kubernetes rollout history<br>
  - ReplicaSet changes<br>
  - Pod recreation<br>
  - Image tag confirmation in running pods<br>

The following approach avoids unreliable browser-based verification and reflects real production practices.<br>
    kubectl describe pod <pod-name>

-----

## Key Learnings 📖
  - Difference between CI and CD<br>
  - Why the latest Docker tag should be avoided<br>
  - How Kubernetes rolling deployments work internally<br>
  - How to debug real CI/CD failures<br>
  - Importance of versioned artifacts in deployment pipelines<br>

## Project Status 🎯
  - CI Pipeline: ✅ Complete<br>
  - CD Pipeline: ✅ Complete<br>
  - Docker Hub Integration: ✅ Complete<br>
  - Kubernetes Deployment: ✅ Complete<br>
  - Production Practices: ✅ Followed<br>

-----

## Conclusion 🏁
This project implements a real, production-style CI/CD pipeline using modern DevOps tools.<br>
It emphasizes correctness, debuggability, and industry best practices over shortcuts.<br>

-----

## Author 📝
**Janhvi Gupta**  
Aspiring DevOps Engineer | Cloud & Kubernetes Enthusiast
