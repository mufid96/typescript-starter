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
        sh 'kubectl create -n typescript'
      }
    }

  }
  environment {
    DOCKERHUB_CREDENTIALS = 'credentials(\'dockerhub\')'
  }
}