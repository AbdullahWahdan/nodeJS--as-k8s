# Node.js Kubernetes Deployment

This project demonstrates deploying a Node.js app on Kubernetes using:

- Deployments with rolling update strategy
- PersistentVolumeClaim for durable storage
- LoadBalancer service for external access


## 📋 Requirements

| #  | Requirement Name           | Details / Steps                                                                                                                                     | Deliverable                                                                                 |
|----|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| 1  | Deploy the Application     | Define your Deployment manifest for the Node.js app, apply it to the cluster, and confirm that your Pod comes up in the Ready state.               | Deployment YAML and evidence that the Pod is running and healthy.                          |
| 2  | Provision and Mount Storage| Create a PersistentVolumeClaim for your app’s data. Update the Deployment manifest to mount the claim into the container’s filesystem, then verify that writes persist. | PVC manifest, updated Deployment manifest, and proof of successful write to the mounted volume. |
| 3  | Expose with LoadBalancer   | Write a Service manifest of type LoadBalancer to route external traffic to your Pods. Apply it and confirm that an external IP is assigned and serving your app. | Service YAML and confirmation that the application is reachable via the LoadBalancer endpoint. |
| 4  | Implement Rolling Updates  | Configure the Deployment’s update strategy to use rolling updates with controlled surge and availability parameters. Trigger an image version change and observe the rollout. | Updated Deployment manifest showing rolling‑update settings and documentation of the update rollout. |

## 📁 Project Structure

- **nodejs-k8s-deployment/**
  - **manifests/**
    - `1-deployment.yaml` – Node.js Deployment manifest  
    - `2-pvc.yaml` – PersistentVolumeClaim manifest  
    - `3-service.yaml` – LoadBalancer Service manifest  
    - `4-deployment-rolling.yaml` – Deployment with rolling update settings  
  - **app/** – *(Optional)* Sample Node.js "Hello World" app  
    - `server.js`  
    - `package.json`  
  - `README.md`  
  - `rollout-log.txt` – Logs or screenshots showing rollout progress
## 🐳 Docker Image

This project uses the prebuilt Docker image:

*aw033/nodejs-hello*

You can test it locally with:

```bash
docker pull aw033/nodejs-hello
docker run -p 3000:3000 aw033/nodejs-hello




