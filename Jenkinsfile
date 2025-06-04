pipeline {
    agent any

    environment {
        IMAGE = 'app'
        TAG = 'latest' // atau pakai versi atau BUILD_NUMBER
        REGISTRY = 'docker.io/mufassirrafi' // contoh: docker.io/johndoe
    }

    stages {
        stage('Build Docker Image') {
      steps {
        script {
          docker.build("${IMAGE}:${TAG}")
        }
      }
    }

    stage('Push to Registry') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
          sh "docker tag ${IMAGE}:${TAG} ${REGISTRY}/${IMAGE}:${TAG}"
          sh "docker push ${REGISTRY}/${IMAGE}:${TAG}"
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        sh 'kubectl apply -f k8s/deployment.yaml'
      }
    }
  }
}
