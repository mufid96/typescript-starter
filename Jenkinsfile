pipeline {
  agent {
    node {
      label 'typescript'
    }

  }
  stages {
    stage('') {
      steps {
        echo 'hello'
      }
    }

  }
  environment {
    appName = 'typescript'
    namespace = 'typescript'
    imageTag = 'neromorph/${appName}:${env.BUILD_NUMBER}'
  }
}