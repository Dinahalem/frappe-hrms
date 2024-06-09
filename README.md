# frappe-hrms

1)Clone the Frappe HR Application Repository:

1.  git clone https://github.com/frappe/hrms
2.  cd hrms
3.  docker build -t your-dockerhub-username/hrms:1.0.0 .
4.  docker login
5.  docker push your-dockerhub-username/hrms:1.0.0
6.  docker-compose up --build
__________________________________________________________________________________________________________________________________________________________________
2)Clone the Frappe Helm repository:

1. git clone https://github.com/frappe/helm
2. cd helm
3. Update the values.yaml file to use your custom Docker image.

images:
  frappe:
    repository: your-dockerhub-username/hrms
    tag: "1.0.0"

3) Deploy the Application to a Kubernetes Cluster:
1. minikube start
2. helm install my-hrms ./path-to-your-modified-helm-chart   #Deploy the application using the modified Helm chart

Implement Multi-Site Feature:
Create Two Sites for the Custom Application
Update your Helm values to include multi-site configuration.
.yaml
Copy code
sites:
  site1:
    domain: site1.local
    apps:
      - hrms
  site2:
    domain: site2.local
    apps:
      - hrms

Testing and Verification:
kubectl get pods          #Verify the application is running
minikube service list     #Ensure the application is accessible via a web browser

