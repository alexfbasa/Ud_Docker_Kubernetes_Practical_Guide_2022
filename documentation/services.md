# Kubernetes Services: Connecting and Enabling Communication

This lecture dives into the fundamental role of Kubernetes services in facilitating communication among various
components within and outside applications. Services play a crucial role in connecting different application parts and
enabling seamless interactions.

## Explanation

Below is a basic example of a `service.yml` file for a Kubernetes Cluster IP service. This example assumes
the service is targeting a set of backend pods running on port 80.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: backend
spec:
  selector:
    app: backend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```

Explanation:

- **`apiVersion`:** Specifies the API version. In this case, it is `v1` for the core/v1 version.
- **`kind`:** Defines the type of Kubernetes resource. For a service, it is set to `Service`.
- **`metadata`:** Contains information about the service, such as its name.
- **`spec`:** Specifies the service's specifications.
    - **`selector`:** Identifies the set of pods that this service will route traffic to. In this example, it targets
      pods with the label `app: backend`.
    - **`ports`:** Specifies the ports to expose on the service.
        - **`protocol`:** Specifies the protocol (TCP, UDP, etc.).
        - **`port`:** Defines the port on the service.
        - **`targetPort`:** Specifies the port to forward traffic to on the selected pods.

You can apply this service definition using the following command:

Here is a basic `Service` definition for a ClusterIP type service. It assumes that there are pods labeled
with `app: myapp` and `type: back-end`. Here it is:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: back-end
spec:
  type: ClusterIP
  ports:
    - targetPort: 80
      port: 80
  selector:
    app: myapp
    type: back-end
```

In this YAML file:

- `apiVersion`: Specifies the API version (v1).
- `kind`: Specifies the type of Kubernetes resource (Service).
- `metadata`: Contains metadata such as the name of the service (`back-end` in this case).
- `spec`: Specifies the service's specifications.
    - `type`: Specifies the type of service, which is `ClusterIP` in this case.
    - `ports`: Specifies the ports to expose.
        - `targetPort`: The port on the pods to which traffic will be forwarded.
        - `port`: The port on the service itself.
    - `selector`: Defines the labels that identify the pods associated with this service. In this example, it assumes
      pods have the labels `app: myapp` and `type: back-end`.

You can apply this YAML file using `kubectl apply -f service-cluster-ip.yml`.

```bash
kubectl apply -f service.yaml
```

This basic `service.yaml` file creates a Cluster IP service named `backend` that forwards traffic to pods labeled
as `app: backend` on port 80. Adjust the labels and ports based on your specific application configuration.

## Importance of Kubernetes Services

- **Connectivity Between Components:**
- Services allow different application groups (e.g., front end, back end, external data source) to communicate
  efficiently.
- Enables loose coupling between microservices within an application.

- **Use Cases:**
- Services make front end applications accessible to end users.
- Facilitate communication between back end and front end components.
- Establish connectivity to external data sources.

## External Communication

- **Node Access:**
- External users can access a web page served by a pod within a Kubernetes cluster.
- However, direct access to pod IPs may be restricted due to network separation.

- **Node Port Service:**
- Kubernetes Service acts as a middle layer to map requests from external users to the corresponding pod.
- Three key ports involved: Target Port (on the pod), Port (on the service), and Node Port (external access).
- Types of services: Node Port, Cluster IP, Load Balancer.

## Creating Node Port Service

- **Definition File:**
- Similar structure to other Kubernetes objects (API version, kind, metadata, spec).
- Type specifies the service type (e.g., node port).
- Ports define target port, service port, and node port.

- **Label and Selector:**
- Use labels and selectors to link the service to the pod.
- Extract labels from the pod definition file and include them in the service selector section.

- **Multi-Pod Scenario:**
- In production, with multiple instances of an application, services automatically select and balance load across
  matching pods.
- Built-in load balancing without additional configuration.

- **Across Multiple Nodes:**
- Services automatically span across all nodes in the cluster, providing access to the application using any node's
  IP.

## Flexibility and Adaptability

- **Automatic Updates:**
- Kubernetes services dynamically adapt to changes in pod instances (additions or removals).
- No need for manual configuration adjustments after creation.

## Summary:

Kubernetes services are essential for establishing seamless communication within applications and connecting them to
external users. Whether handling single or multiple pods, on a single or multiple nodes, services simplify the
networking layer, promoting flexibility and adaptability. Once created, services automatically adjust to changes in the
underlying infrastructure, making them a powerful tool for managing communication in a Kubernetes environment.