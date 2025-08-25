pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "deekshaganesh/static-web-app"
        KUBECONFIG = "/var/lib/jenkins/.kube/config"
    }

    stages {
        stage('Git Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Deeksha-Ganesh/CI-CD-Pipeline-for-Static-Website-with-AWS-EKS.git'
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                script {
                    def IMAGE_TAG = "${env.BUILD_NUMBER}"

                    withCredentials([usernamePassword(credentialsId: 'deekshaganesh', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker build -t ${DOCKER_IMAGE_NAME}:${IMAGE_TAG} ."
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        sh "docker push ${DOCKER_IMAGE_NAME}:${IMAGE_TAG}"
                    }

                    // save IMAGE_TAG for next stage
                    env.IMAGE_TAG = IMAGE_TAG
                }
            }
        }

                stage('Deploy to Kubernetes') {
            steps {
                script {
        
                    sh """
                        mkdir -p /var/lib/jenkins/.kube
                        aws eks update-kubeconfig \
                            --region us-east-1 \
                            --name jimin-eks \
                            --kubeconfig /var/lib/jenkins/.kube/config
                    """

                    sh "sed -i 's|image: ${DOCKER_IMAGE_NAME}:.*|image: ${DOCKER_IMAGE_NAME}:${IMAGE_TAG}|' deployment.yaml"

                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }
    }
}
