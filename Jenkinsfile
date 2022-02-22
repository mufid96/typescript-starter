pipeline {
  agent {
    node {
      label 'typescript'
    }

  }
  stages {
    stage('Git') {
      steps {
        sh 'git pull'
      }
    }

    stage('Build') {
      steps {
        sh 'docker build -t neromorph/typescript:latest .'
      }
    }

    stage('Push') {
      steps {
        sh 'docker push neromorph/typescript:latest'
      }
    }

    stage('Deploy') {
      steps {
        sh 'kubectl create namespace typescript'
        sh 'kubectl apply -f k8s/typescript-deployment.yaml -n typescript'
        sh 'kubectl apply -f k8s/typescript-service.yaml -n typescript'
      }
    }

    stage('Done') {
      steps {
        echo 'Selesai!'
      }
    }

  }
  environment {
    DOCKERHUB_CREDENTIALS = 'credentials(\'dockerhub\')'
  }
}