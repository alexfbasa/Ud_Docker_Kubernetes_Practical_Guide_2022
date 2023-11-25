### Basic Commands:

**Get Information:**

- `kubectl version`: Display the Kubernetes client and server versions.
- `kubectl cluster-info`: Display cluster information.
- `kubectl get replicaset`: Display replicaset information.
- `kubectl get pods,svc`: Display pods and service information.

```bash
minikube service service-name --url  # will display the URL of the service
```

**Create:**

- `kubectl apply -f pod-definition.yml`: Create pod from a file.
- `kubectl create -f replicateset-definition.yml`: Create replica definition from a file.
- `kubectl cluster-info`: Display cluster information.

**Delete:**

- `kubectl apply -f pod-definition.yml`: Create pod from a file.
- `kubectl delete replicaset myapp-replicaset`: Create replica definition from a file.
- `kubectl delete pods --all`: f you want to delete all pods, you can use it:

**Nodes and Pods:**

- `kubectl get nodes`: List all nodes in the cluster.
- `kubectl get pods`: List all pods in the default namespace.

This command will delete all pods in the current namespace. If you want to delete pods in a specific namespace, you can
use the -n flag followed by the namespace name:

```bash
kubectl delete pods --all -n your-namespace
```

Make sure to replace your-namespace with the actual namespace where your pods are running.
Similarly, you can delete other resources like services, deployments, etc., using similar commands. For example:

```commandline
kubectl delete services --all
kubectl delete deployments --all
```

**Describe:**

- `kubectl describe node <node-name>`: Display details about a specific node.
- `kubectl describe pod <pod-name>`: Display details about a specific pod.

**Deployments:**

- `kubectl get deployments`: List all deployments.
- `kubectl describe deployment <deployment-name>`: Display details about a specific deployment.

**Services:**

- `kubectl get services`: List all services.
- `kubectl describe service <service-name>`: Display details about a specific service.

### Interaction:

**Exec into a Pod:**

- `kubectl exec -it <pod-name> -- /bin/bash`: Open a shell in a running pod.

**Logs:**

- `kubectl logs <pod-name>`: Display the logs of a pod.

### Configuration:

**Apply Configurations:**

- `kubectl apply -f <file.yml>`: Apply a configuration file.

**Edit:**

- `kubectl edit <resource-type> <resource-name>`: Edit a resource in real-time.

### Scaling:

**Scale:**

- `kubectl replace -f replicaset-definition.yml`: When you have increased replicas into the yml file
- `kubectl scale --replicas=6 -f replicaset-definition.yml`: Scale running command
- `kubectl scale --replicas=6 replicaset myapp-replicaset`: Scale automatically
- `kubectl scale deployment <deployment-name> --replicas=<replica-count>`: Scale the number of replicas in a deployment.

### Deletion:

**Delete:**

- `kubectl delete pod <pod-name>`: Delete a pod.
- `kubectl delete deployment <deployment-name>`: Delete a deployment.
- `kubectl delete service <service-name>`: Delete a service.

**Delete All Resources in a Namespace:**

- `kubectl delete all --all -n <namespace>`: Delete all resources in a specific namespace.

### Troubleshooting:

**Events:**

- `kubectl get events`: Display cluster events.

**Check Status:**

- `kubectl get componentstatuses`: Check the status of cluster components.

**API Resources:**

- `kubectl api-resources`: List supported API resources.

**Get YAML Configuration:**

- `kubectl get <resource-type> <resource-name> -o yaml`: Retrieve the YAML configuration of a resource.
