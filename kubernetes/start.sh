#!/bin/bash

kubectl apply -f deployment.yml
kubectl apply -f service.yml

minikube service web-academy-nginx-service --url