# Summary:

In Kubernetes, a Pod is the smallest deployable unit that represents a single instance of a running process. However,
relying on a single Pod for an application introduces a risk of downtime in case of failures. To address this,
Replication Controllers and Replica Sets come into play.

**Replication Controller:**

- **Purpose:** Ensures high availability by running and maintaining a specified number of Pods, even if it's just one or
  more.
- **Parameters for YAML file:**
    - `apiVersion: v1`
    - `kind: ReplicationController`
    - `metadata:` with name and labels
    - `spec:` with replicas (number of desired Pods) and a template for Pod definition.

- **Example YAML:**
```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: my-AB-RC
  labels:
    app: my-app
    type: frontend
spec:
  replicas: 3
  template:
    metadata:
      labels:
        app: my-app
        type: frontend
    spec:
      containers:
      - name: my-container
        image: my-image
```

**Replica Set:**

- **Purpose:** Similar to Replication Controller but an updated technology, ensuring a specified number of Pods.
- **Parameters for YAML file:**
    - `apiVersion: apps/v1`
    - `kind: ReplicaSet`
    - `metadata:` with name and labels
    - `spec:` with replicas, template for Pod definition, and a selector to identify Pods it manages.
- **Example YAML:**
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-AB-RS
  labels:
    app: my-app
    type: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
      type: frontend
  template:
    metadata:
      labels:
        app: my-app
        type: frontend
    spec:
      containers:
      - name: my-container
        image: my-image
```

**Differences:**

- Replica Set is the recommended successor to Replication Controller.
- Replica Set requires a selector, whereas it is optional for Replication Controller.
- Replica Set can manage Pods not created by itself if they match the selector.

**Scaling:**

- For both Replication Controller and Replica Set, you can scale by updating the replicas field in the definition file
  and applying it or by using the `kubectl scale` command.

