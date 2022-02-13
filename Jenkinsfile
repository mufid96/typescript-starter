pipeline {
  agent {
    node {
      label 'typescript'
    }

  }
  stages {
    stage('Git') {
      steps {
        git(url: 'git@github.com:neromorph/typescript-starter.git', branch: 'master', changelog: true)
      }
    }

    stage('Docker') {
      steps {
        sh 'docker build -t ${imageTag} .'
        sh 'docker tag ${imageTag}'
        sh 'docker push ${imageTag}'
      }
    }

    stage('Kubernetes') {
      steps {
        sh 'kubectl get ns ${namespace} || kubectl create ns ${namespace}'
        sh '''//Update the imagetag to the latest version
sed -i.bak \'s#neromorph/${appName}:${imageTag}#\' ./k8s/*-deployment.yaml'''
        sh 'kubectl apply -f k8s/$appName-deployment.yaml -n $namespace'
        sh 'kubectl apply -f k8s/$appName-service.yaml -n $namespace'
      }
    }

  }
  environment {
    appName = 'typescript'
    namespace = 'typescript'
    imageTag = 'neromorph/${appName}:${env.BUILD_NUMBER}'
  }
}