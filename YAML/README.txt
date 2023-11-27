kubectl apply -f 00-role.yml 
kubectl apply -f 00-account.yml
kubectl apply -f 01-role-binding.yml
kubectl apply -f 02-traefik.yml
kubectl apply -f 02-traefik-services.yml
kubectl apply -f 03-whoami.yml
kubectl apply -f 03-whoami-services.yml
kubectl apply -f 04-whoami-ingress.yml

minikube tunnel

http://localhost:8080

curl -v http://localhost/