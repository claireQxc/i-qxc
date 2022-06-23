apiVersion: v1
kind: Namespace
metadata:
  name: {K8S_NAMESPACE}
  labels:
    app: {APP_NAME}

apiVersion: apps/v1
kind: Deployment
metadata:
  name: {APP_NAME}-deployment
  namespace: {K8S_NAMESPACE}
  labels:
    appname: {APP_NAME}
spec:
  replicas: 1
  selector:
    matchLabels:
        appname: {APP_NAME}
  template:
    metadata:
      labels:
        appname: {APP_NAME}
    spec:
      containers:
      - name: {APP_NAME}
        image: {IMAGE_URL}:{IMAGE_TAG}  #镜像地址
        ports:
          - containerPort: 40080
      imagePullSecrets:        #使用的secret
       - name: registry-secret

---
apiVersion: v1
kind: Service
metadata:
  name: www-service
  namespace: {K8S_NAMESPACE}
spec:
  type: LoadBalancer
  selector:
    appname: {APP_NAME}
  ports:
  - protocol: TCP
    port: 80
    targetPort: 40080

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: www-ingress
  namespace: {K8S_NAMESPACE}
spec:
  ingressClassName: nginx
  rules:
  - host: i-qxc.com
    http:
      paths:
      - path: "/"
        pathType: Prefix
        backend:
          service:
            name: www-service
            port:
              number: 80
