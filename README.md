## build sample image:
> docker build -t fastapi-sample:latest .

## tag it:

> docker tag fastapi-sample:latest studio-registry:5000/fastapi-sample:latest

## push it to registry:

> docker push studio-registry:5000/fastapi-sample:latest

## deploy to K3d:

> kubectl apply -f ./k3d/deployment.yml

> kubectl apply -f ./k3d/service.yml

> kubectl apply -f ./k3d/ingress.yml