pipeline {
    agent any

    environment {
        DOCKER_USERNAME = "deekshaganesh"           // your Docker Hub username
        DOCKER_PASSWORD = "your-docker-password-or-PAT" // your Docker Hub password or PAT
        DOCKER_IMAGE_NAME = "deekshaganesh/static-web-app"
        KUBECONFIG = "/var/lib/jenkins/.kube/config"
    }

    stages {
        stage('Git Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Deeksha-Ganesh/CI-CD-Pipeline-for-Static-Website-with-AWS-EKS.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE_NAME}:latest ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                sh "docker push ${DOCKER_IMAGE_NAME}:latest"
            }
        }

        stage('Deployment in Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }
}
