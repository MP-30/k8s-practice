ubuntu@k8s-master:~$ helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set controller.service.type=NodePort \
  --set controller.hostPort.enabled=true \
  --set controller.hostPort.ports.http=80 \
  --set controller.hostPort.ports.https=443 \
  --set controller.kind=DaemonSet --dry-run

# What it created
ServiceAccount
ClusterRole
ClusterRoleBinding
Role
RoleBinding
Jobs
ServiceAccount
ConfigMap
ClusterRole
ClusterRoleBinding
Service
DaemonSet
IngressClass
Secret
ValidatingWebhookConfiguration




# Result

Release "nginx-ingress" does not exist. Installing it now.
NAME: nginx-ingress
LAST DEPLOYED: Wed Jul 15 02:29:35 2026
NAMESPACE: ingress-nginx
STATUS: pending-install
REVISION: 1
TEST SUITE: None
HOOKS:
---
# Source: ingress-nginx/templates/admission-webhooks/job-patch/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nginx-ingress-ingress-nginx-admission
  namespace: ingress-nginx
  annotations:
    "helm.sh/hook": pre-install,pre-upgrade,post-install,post-upgrade
    "helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: admission-webhook
automountServiceAccountToken: true
---
# Source: ingress-nginx/templates/admission-webhooks/job-patch/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: nginx-ingress-ingress-nginx-admission
  annotations:
    "helm.sh/hook": pre-install,pre-upgrade,post-install,post-upgrade
    "helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: admission-webhook
rules:
  - apiGroups:
      - admissionregistration.k8s.io
    resources:
      - validatingwebhookconfigurations
    verbs:
      - get
      - update
---
# Source: ingress-nginx/templates/admission-webhooks/job-patch/clusterrolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: nginx-ingress-ingress-nginx-admission
  annotations:
    "helm.sh/hook": pre-install,pre-upgrade,post-install,post-upgrade
    "helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: admission-webhook
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: nginx-ingress-ingress-nginx-admission
subjects:
  - kind: ServiceAccount
    name: nginx-ingress-ingress-nginx-admission
    namespace: ingress-nginx
---
# Source: ingress-nginx/templates/admission-webhooks/job-patch/role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: nginx-ingress-ingress-nginx-admission
  namespace: ingress-nginx
  annotations:
    "helm.sh/hook": pre-install,pre-upgrade,post-install,post-upgrade
    "helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: admission-webhook
rules:
  - apiGroups:
      - ""
    resources:
      - secrets
    verbs:
      - get
      - create
---
# Source: ingress-nginx/templates/admission-webhooks/job-patch/rolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: nginx-ingress-ingress-nginx-admission
  namespace: ingress-nginx
  annotations:
    "helm.sh/hook": pre-install,pre-upgrade,post-install,post-upgrade
    "helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: admission-webhook
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: nginx-ingress-ingress-nginx-admission
subjects:
  - kind: ServiceAccount
    name: nginx-ingress-ingress-nginx-admission
    namespace: ingress-nginx
---
# Source: ingress-nginx/templates/admission-webhooks/job-patch/job-createSecret.yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: nginx-ingress-ingress-nginx-admission-create
  namespace: ingress-nginx
  annotations:
    "helm.sh/hook": pre-install,pre-upgrade
    "helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: admission-webhook
spec:
  ttlSecondsAfterFinished: 0
  template:
    metadata:
      name: nginx-ingress-ingress-nginx-admission-create
      labels:
        helm.sh/chart: ingress-nginx-4.15.1
        app.kubernetes.io/name: ingress-nginx
        app.kubernetes.io/instance: nginx-ingress
        app.kubernetes.io/version: "1.15.1"
        app.kubernetes.io/part-of: ingress-nginx
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/component: admission-webhook
    spec:
      containers:
        - name: create
          image: registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.6.9@sha256:01038e7de14b78d702d2849c3aad72fd25903c4765af63cf16aa3398f5d5f2dd
          imagePullPolicy: IfNotPresent
          args:
            - create
            - --host=nginx-ingress-ingress-nginx-controller-admission,nginx-ingress-ingress-nginx-controller-admission.$(POD_NAMESPACE).svc
            - --namespace=$(POD_NAMESPACE)
            - --secret-name=nginx-ingress-ingress-nginx-admission
          env:
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
          securityContext: 
            allowPrivilegeEscalation: false
            capabilities:
              drop:
              - ALL
            readOnlyRootFilesystem: true
            runAsGroup: 65532
            runAsNonRoot: true
            runAsUser: 65532
            seccompProfile:
              type: RuntimeDefault
      restartPolicy: OnFailure
      serviceAccountName: nginx-ingress-ingress-nginx-admission
      automountServiceAccountToken: true
      nodeSelector: 
        kubernetes.io/os: linux
---
# Source: ingress-nginx/templates/admission-webhooks/job-patch/job-patchWebhook.yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: nginx-ingress-ingress-nginx-admission-patch
  namespace: ingress-nginx
  annotations:
    "helm.sh/hook": post-install,post-upgrade
    "helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: admission-webhook
spec:
  ttlSecondsAfterFinished: 0
  template:
    metadata:
      name: nginx-ingress-ingress-nginx-admission-patch
      labels:
        helm.sh/chart: ingress-nginx-4.15.1
        app.kubernetes.io/name: ingress-nginx
        app.kubernetes.io/instance: nginx-ingress
        app.kubernetes.io/version: "1.15.1"
        app.kubernetes.io/part-of: ingress-nginx
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/component: admission-webhook
    spec:
      containers:
        - name: patch
          image: registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.6.9@sha256:01038e7de14b78d702d2849c3aad72fd25903c4765af63cf16aa3398f5d5f2dd
          imagePullPolicy: IfNotPresent
          args:
            - patch
            - --webhook-name=nginx-ingress-ingress-nginx-admission
            - --namespace=$(POD_NAMESPACE)
            - --patch-mutating=false
            - --secret-name=nginx-ingress-ingress-nginx-admission
            - --patch-failure-policy=Fail
          env:
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
          securityContext: 
            allowPrivilegeEscalation: false
            capabilities:
              drop:
              - ALL
            readOnlyRootFilesystem: true
            runAsGroup: 65532
            runAsNonRoot: true
            runAsUser: 65532
            seccompProfile:
              type: RuntimeDefault
      restartPolicy: OnFailure
      serviceAccountName: nginx-ingress-ingress-nginx-admission
      automountServiceAccountToken: true
      nodeSelector: 
        kubernetes.io/os: linux
MANIFEST:
---
# Source: ingress-nginx/templates/controller-serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: controller
  name: nginx-ingress-ingress-nginx
  namespace: ingress-nginx
automountServiceAccountToken: true
---
# Source: ingress-nginx/templates/controller-configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: controller
  name: nginx-ingress-ingress-nginx-controller
  namespace: ingress-nginx
data:
---
# Source: ingress-nginx/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
  name: nginx-ingress-ingress-nginx
rules:
  - apiGroups:
      - ""
    resources:
      - configmaps
      - endpoints
      - nodes
      - pods
      - secrets
      - namespaces
    verbs:
      - list
      - watch
  - apiGroups:
      - coordination.k8s.io
    resources:
      - leases
    verbs:
      - list
      - watch
  - apiGroups:
      - ""
    resources:
      - nodes
    verbs:
      - get
  - apiGroups:
      - ""
    resources:
      - services
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingresses
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - ""
    resources:
      - events
    verbs:
      - create
      - patch
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingresses/status
    verbs:
      - update
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingressclasses
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - discovery.k8s.io
    resources:
      - endpointslices
    verbs:
      - list
      - watch
      - get
---
# Source: ingress-nginx/templates/clusterrolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
  name: nginx-ingress-ingress-nginx
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: nginx-ingress-ingress-nginx
subjects:
  - kind: ServiceAccount
    name: nginx-ingress-ingress-nginx
    namespace: ingress-nginx
---
# Source: ingress-nginx/templates/controller-role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: controller
  name: nginx-ingress-ingress-nginx
  namespace: ingress-nginx
rules:
  - apiGroups:
      - ""
    resources:
      - namespaces
    verbs:
      - get
  - apiGroups:
      - ""
    resources:
      - configmaps
      - pods
      - secrets
      - endpoints
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - ""
    resources:
      - services
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingresses
    verbs:
      - get
      - list
      - watch
  # Omit Ingress status permissions if `--update-status` is disabled.
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingresses/status
    verbs:
      - update
  - apiGroups:
      - networking.k8s.io
    resources:
      - ingressclasses
    verbs:
      - get
      - list
      - watch
  - apiGroups:
      - coordination.k8s.io
    resources:
      - leases
    resourceNames:
      - nginx-ingress-ingress-nginx-leader
    verbs:
      - get
      - update
  - apiGroups:
      - coordination.k8s.io
    resources:
      - leases
    verbs:
      - create
  - apiGroups:
      - ""
    resources:
      - events
    verbs:
      - create
      - patch
  - apiGroups:
      - discovery.k8s.io
    resources:
      - endpointslices
    verbs:
      - list
      - watch
      - get
---
# Source: ingress-nginx/templates/controller-rolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: controller
  name: nginx-ingress-ingress-nginx
  namespace: ingress-nginx
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: nginx-ingress-ingress-nginx
subjects:
  - kind: ServiceAccount
    name: nginx-ingress-ingress-nginx
    namespace: ingress-nginx
---
# Source: ingress-nginx/templates/controller-service-webhook.yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: controller
  name: nginx-ingress-ingress-nginx-controller-admission
  namespace: ingress-nginx
spec:
  type: ClusterIP
  ports:
    - name: https-webhook
      port: 443
      targetPort: webhook
      appProtocol: https
  selector:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/component: controller
---
# Source: ingress-nginx/templates/controller-service.yaml
apiVersion: v1
kind: Service
metadata:
  annotations:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: controller
  name: nginx-ingress-ingress-nginx-controller
  namespace: ingress-nginx
spec:
  type: NodePort
  ipFamilyPolicy: SingleStack
  ipFamilies: 
    - IPv4
  ports:
    - name: http
      port: 80
      protocol: TCP
      targetPort: http
      appProtocol: http
    - name: https
      port: 443
      protocol: TCP
      targetPort: https
      appProtocol: https
  selector:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/component: controller
---
# Source: ingress-nginx/templates/controller-daemonset.yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: controller
  name: nginx-ingress-ingress-nginx-controller
  namespace: ingress-nginx
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: ingress-nginx
      app.kubernetes.io/instance: nginx-ingress
      app.kubernetes.io/component: controller
  revisionHistoryLimit: 10
  minReadySeconds: 0
  template:
    metadata:
      labels:
        helm.sh/chart: ingress-nginx-4.15.1
        app.kubernetes.io/name: ingress-nginx
        app.kubernetes.io/instance: nginx-ingress
        app.kubernetes.io/version: "1.15.1"
        app.kubernetes.io/part-of: ingress-nginx
        app.kubernetes.io/managed-by: Helm
        app.kubernetes.io/component: controller
    spec:
      dnsPolicy: ClusterFirst
      containers:
        - name: controller
          image: registry.k8s.io/ingress-nginx/controller:v1.15.1@sha256:594ceea76b01c592858f803f9ff4d2cb40542cae2060410b2c95f75907d659e1
          imagePullPolicy: IfNotPresent
          lifecycle: 
            preStop:
              exec:
                command:
                - /wait-shutdown
          args: 
            - /nginx-ingress-controller
            - --publish-service=$(POD_NAMESPACE)/nginx-ingress-ingress-nginx-controller
            - --election-id=nginx-ingress-ingress-nginx-leader
            - --controller-class=k8s.io/ingress-nginx
            - --ingress-class=nginx
            - --configmap=$(POD_NAMESPACE)/nginx-ingress-ingress-nginx-controller
            - --validating-webhook=:8443
            - --validating-webhook-certificate=/usr/local/certificates/cert
            - --validating-webhook-key=/usr/local/certificates/key
          securityContext: 
            runAsNonRoot: true
            runAsUser: 101
            runAsGroup: 82
            allowPrivilegeEscalation: false
            seccompProfile: 
              type: RuntimeDefault
            capabilities:
              drop:
              - ALL
              add:
              - NET_BIND_SERVICE
            readOnlyRootFilesystem: false
          env:
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: LD_PRELOAD
              value: /usr/local/lib/libmimalloc.so
          livenessProbe: 
            failureThreshold: 5
            httpGet:
              path: /healthz
              port: 10254
              scheme: HTTP
            initialDelaySeconds: 10
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 1
          readinessProbe: 
            failureThreshold: 3
            httpGet:
              path: /healthz
              port: 10254
              scheme: HTTP
            initialDelaySeconds: 10
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 1
          ports:
            - name: http
              containerPort: 80
              protocol: TCP
              hostPort: 80
            - name: https
              containerPort: 443
              protocol: TCP
              hostPort: 443
            - name: webhook
              containerPort: 8443
              protocol: TCP
          volumeMounts:
            - name: webhook-cert
              mountPath: /usr/local/certificates/
              readOnly: true
          resources: 
            requests:
              cpu: 100m
              memory: 90Mi
      nodeSelector: 
        kubernetes.io/os: linux
      serviceAccountName: nginx-ingress-ingress-nginx
      automountServiceAccountToken: true
      terminationGracePeriodSeconds: 300
      volumes:
        - name: webhook-cert
          secret:
            secretName: nginx-ingress-ingress-nginx-admission
---
# Source: ingress-nginx/templates/controller-ingressclass.yaml
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: controller
  name: nginx
spec:
  controller: k8s.io/ingress-nginx
---
# Source: ingress-nginx/templates/controller-poddisruptionbudget.yaml
# PDB is not supported for DaemonSets.
# https://github.com/kubernetes/kubernetes/issues/108124
---
# Source: ingress-nginx/templates/admission-webhooks/validating-webhook.yaml
# before changing this value, check the required kubernetes version
# https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#prerequisites
apiVersion: admissionregistration.k8s.io/v1
kind: ValidatingWebhookConfiguration
metadata:
  annotations:
  labels:
    helm.sh/chart: ingress-nginx-4.15.1
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: nginx-ingress
    app.kubernetes.io/version: "1.15.1"
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/component: admission-webhook
  name: nginx-ingress-ingress-nginx-admission
webhooks:
  - name: validate.nginx.ingress.kubernetes.io
    matchPolicy: Equivalent
    rules:
      - apiGroups:
          - networking.k8s.io
        apiVersions:
          - v1
        operations:
          - CREATE
          - UPDATE
        resources:
          - ingresses
    failurePolicy: Fail
    sideEffects: None
    admissionReviewVersions:
      - v1
    clientConfig:
      service:
        name: nginx-ingress-ingress-nginx-controller-admission
        namespace: ingress-nginx
        port: 443
        path: /networking/v1/ingresses

NOTES:
The ingress-nginx controller has been installed.
Get the application URL by running these commands:
  export HTTP_NODE_PORT=$(kubectl get service --namespace ingress-nginx nginx-ingress-ingress-nginx-controller --output jsonpath="{.spec.ports[0].nodePort}")
  export HTTPS_NODE_PORT=$(kubectl get service --namespace ingress-nginx nginx-ingress-ingress-nginx-controller --output jsonpath="{.spec.ports[1].nodePort}")
  export NODE_IP="$(kubectl get nodes --output jsonpath="{.items[0].status.addresses[1].address}")"

  echo "Visit http://${NODE_IP}:${HTTP_NODE_PORT} to access your application via HTTP."
  echo "Visit https://${NODE_IP}:${HTTPS_NODE_PORT} to access your application via HTTPS."

An example Ingress that makes use of the controller:
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: foo
  spec:
    ingressClassName: nginx
    rules:
      - host: www.example.com
        http:
          paths:
            - pathType: Prefix
              backend:
                service:
                  name: exampleService
                  port:
                    number: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
      - hosts:
        - www.example.com
        secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls