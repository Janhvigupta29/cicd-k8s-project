## CI/CD Pipeline with Docker & Kubernetes
This project demonstrates an end-to-end CI/CD pipeline that automates the build, containerization, and deployment of a Node.js application using GitHub Actions, Docker, Docker Hub, and Kubernetes.
The pipeline follows real-world DevOps practices, including versioned Docker images and Kubernetes rolling deployments.

------

## Project Overview
The goal of this project is to implement a reliable CI/CD workflow where:
  -Code changes automatically trigger a CI pipeline
  -A Docker image is built and pushed to Docker Hub
  -Kubernetes deploys the new image using rolling updates
  -The application remains available during deployment
  -This project focuses on clarity, correctness, and production-style workflows, not shortcuts.

------

## Tech Stack 
-Node.js – Backend application
-Docker – Containerization
-Docker Hub – Container image registry
-GitHub Actions – CI automation
-Kubernetes (Minikube) – Container orchestration
-kubectl – Kubernetes management

------

## Project Structure 📂
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

------

## Application Overview 🔄
-A simple Node.js web server
-Listens on port 3000
-Configured to bind to 0.0.0.0 for Kubernetes compatibility

------

## Continuous Integration (CI)
The CI pipeline is implemented using GitHub Actions and runs automatically on every push to the main branch.

**CI Workflow:-**
  ~GitHub Actions checks out the repository
  ~Logs in to Docker Hub using GitHub Secrets
  ~Builds a Docker image
  ~Tags the image using the commit SHA
  ~Pushes the image to Docker Hub

**Why Commit-SHA Image Tags?**
  ~Avoids Docker image caching issues
  ~Makes deployments traceable
  ~Ensures Kubernetes always deploys a new version
  ~Industry best practice (avoids latest tag problems)

**Example image tag:**
      janhvigupta29/cicd-k8s-project:7b3e7bff33d13836eec264da17af095ace67f2c

------

## Continuous Deployment (CD)
After a successful CI build, the application is deployed to a Kubernetes cluster using a rolling update strategy.

**CD Workflow:-**
  ~CI produces a versioned Docker image
  ~Kubernetes deployment is updated to use the new image
  ~Kubernetes performs a rolling update
  ~Old pods are terminated gradually while new pods are created
  ~Application remains available during deployment

**Key Deployment Commands**
kubectl set image deployment/cicd-app app=janhvigupta29/cicd-k8s-project:<commit-sha>
kubectl rollout status deployment cicd-app
kubectl scale deployment cicd-app --replicas=2

**Deployment Features**
  ~Versioned Docker images
  ~Rolling updates with zero downtime
  ~Clear separation of CI (build) and CD (deploy)
  ~Deployment verification via image tags

-----

## Kubernetes Resources

**Deployment:-**
  ~Manages application pods
  ~Uses rolling update strategy
  ~Scales replicas as required
  
**Service:-**
  ~Exposes the application internally
  ~Allows access via Minikube service tunnel

-----

## Verification & Debugging

Deployment success is verified by:=
  ~Kubernetes rollout history
  ~ReplicaSet changes
  ~Pod recreation
  ~Image tag confirmation in running pods

The following approach avoids unreliable browser-based verification and reflects real production practices.
    kubectl describe pod <pod-name>

-----

## Key Learnings 📖
  -Difference between CI and CD
  -Why the latest Docker tag should be avoided
  -How Kubernetes rolling deployments work internally
  -How to debug real CI/CD failures
  -Importance of versioned artifacts in deployment pipelines

## Project Status 🎯
  -CI Pipeline: ✅ Complete
  -CD Pipeline: ✅ Complete
  -Docker Hub Integration: ✅ Complete
  -Kubernetes Deployment: ✅ Complete
  -Production Practices: ✅ Followed

-----

## Conclusion 🏁
This project implements a real, production-style CI/CD pipeline using modern DevOps tools.
It emphasizes correctness, debuggability, and industry best practices over shortcuts.

-----

## Author 📝
**Janhvi Gupta**  
Aspiring DevOps Engineer | Cloud & Kubernetes Enthusiast
