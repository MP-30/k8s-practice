For official references, you can find the detailed concepts and YAML specifications for these resources in the [Kubernetes Documentation](https://kubernetes.io/docs/home/). [1, 2] 
## Core Workload Resources

* Pods: The smallest deployable units you can create and manage in Kubernetes.
* [Documentation: Pods](https://kubernetes.io/docs/concepts/workloads/pods/)
* Deployments: Provides declarative updates for Pods and ReplicaSets; ideal for stateless applications.
* [Documentation: Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
* StatefulSets: Manages the deployment and scaling of a set of Pods with guarantees about ordering and uniqueness (essential for databases).
* [Documentation: StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
* DaemonSets: Ensures that all (or some) Nodes run a copy of a specific Pod.
* [Documentation: DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) [3, 4, 5, 6, 7, 8, 9] 

## Networking & Configuration

* Services: An abstract way to expose an application running on a set of Pods as a network service.
* [Documentation: Service](https://kubernetes.io/docs/concepts/services-networking/service/)
* ConfigMaps: Allows you to decouple environment-specific configuration from container images.
* [Documentation: ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/)
* Secrets: Similar to ConfigMaps but specifically intended to hold sensitive information.
* [Documentation: Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) [10, 11, 12, 13, 14] 

## API & Glossary

* Kubernetes API Reference: Complete list of all resource fields and versions.
* API Reference Docs
* Glossary: Quick definitions for all Kubernetes terminology.
* [Kubernetes Glossary](https://kubernetes.io/docs/reference/glossary/) [15, 16] 

Would you like a sample Service YAML to see how to expose your current Deployment to the network?

[1] [https://kubernetes.io](https://kubernetes.io/docs/home/)
[2] [https://kubernetes.io](https://kubernetes.io/docs/home/)
[3] [https://kubernetes.io](https://kubernetes.io/docs/concepts/workloads/pods/)
[4] [https://kubernetes.io](https://kubernetes.io/docs/concepts/workloads/pods/)
[5] [https://kubernetes.io](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
[6] [https://kubernetes.io](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
[7] [https://kubernetes.io](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
[8] [https://kubernetes.io](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
[9] [https://kubernetes.io](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)
[10] [https://kubernetes.io](https://kubernetes.io/docs/concepts/services-networking/service/)
[11] [https://kubernetes.io](https://kubernetes.io/docs/concepts/services-networking/service/)
[12] [https://kubernetes.io](https://kubernetes.io/docs/concepts/configuration/configmap/)
[13] [https://kubernetes.io](https://kubernetes.io/docs/concepts/configuration/configmap/)
[14] [https://kubernetes.io](https://kubernetes.io/docs/concepts/configuration/secret/)
[15] [https://kubernetes.io](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.26/)
[16] [https://kubernetes.io](https://kubernetes.io/docs/reference/glossary/)

