pipeline {
  agent {
    node {
      label 'typescript'
    }

  }
  stages {
    stage('Git') {
      steps {
        git(url: 'https://github.com/neromorph/typescript-starter.git', branch: 'master', changelog: true)
      }
    }

    stage('Docker') {
      
      steps {
        def customImage = docker.build("neromorph/typescript:$${env.BUILD_ID}'")
        customImage.push()
    }
      }
    }

    stage('Kubernetes') {
      steps {
        def appName = 'typescript'
        def namespace = 'typescript'
        def imageTag = 'neromorph/${appName}:${env.BUILD_NUMBER}'

        sh 'kubectl get ns ${namespace} || kubectl create ns ${namespace}'
        sh '''sed -i.bak \'s#neromorph/${appName}:${imageTag}#\' ./k8s/*-deployment.yaml'''
        sh 'kubectl apply -f k8s/${appName}-deployment.yaml -n ${namespace}'
        sh 'kubectl apply -f k8s/${appName}-service.yaml -n ${namespace}'
      }
    }

  }
  environment {
    appName = 'typescript'
    namespace = 'typescript'
    imageTag = 'neromorph/${appName}:${env.BUILD_NUMBER}'
  }
}