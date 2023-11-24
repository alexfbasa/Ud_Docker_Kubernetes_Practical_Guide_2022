# Kubernetes Deployment Upgrades

Understanding how Kubernetes Deployments handle upgrades is crucial for maintaining the availability and reliability of
applications. Let's explore the key concepts and commands related to deployment upgrades.

## Deployment Revisions

- When creating a deployment, it triggers a rollout, generating a new deployment revision (e.g., Revision 1).
- Subsequent upgrades result in new rollout triggers and additional deployment revisions (e.g., Revision 2).
- Deployment revisions facilitate tracking changes and enable rollbacks to a previous state if needed.

## Monitoring Rollouts

- Check rollout status: `kubectl rollout status <deployment-name>` provides real-time information about the deployment's
  status during an upgrade.
- View rollout history: `kubectl rollout history deployment <deployment-name>` shows a detailed history of revisions and
  rollouts.

## Deployment Strategies

- **Recreate Strategy:**
    - All existing instances are destroyed simultaneously before deploying new instances.
    - This strategy may cause downtime during the transition.
    - Not the default deployment strategy.

- **Rolling Update Strategy:**
    - Older instances are taken down, and newer versions are brought up one by one.
    - Ensures the application remains accessible during upgrades.
    - Default deployment strategy if not explicitly specified.

## Performing Updates

- Update using `kubectl apply -f <file.yml>`: Modify the deployment definition file, then apply changes
  with `kubectl apply` to trigger a new rollout.
- Update using `kubectl set image deployment/<deployment-name> <container-name>=<new-image>`: Directly update the image
  of the application container. Exercise caution as this alters the deployment configuration.

## Examining Deployment Details

- Use `kubectl describe deployment <deployment-name>` to get detailed information about a deployment.
- Differentiate between recreate and rolling update strategies by examining the events section.

## Rollback Operations

- Roll back to a previous revision: `kubectl rollout undo deployment <deployment-name>`.
- The deployment will destroy pods in the new replica set and bring back the older ones from the previous revision.

## Quick Commands Summary:

- Create Deployment: `kubectl create -f <file.yml>`
- List Deployments: `kubectl get deployments`
- Update Deployment: `kubectl apply -f <file.yml>`
  or `kubectl set image deployment/myapp-deployment nginx=nginx:1.9.1`
- Check Rollout Status: `kubectl rollout status <deployment-name>`
- View Rollout History: `kubectl rollout history deployment <deployment-name>`
- Rollback Deployment: `kubectl rollout undo deployment <deployment-name>`

Understanding and mastering these commands is essential for effectively managing deployments in a Kubernetes
environment.