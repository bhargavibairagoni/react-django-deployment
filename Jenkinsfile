pipeline {
  agent any
  stages {
    stage("code") {
        steps {
            git branch: 'master', url: 'https://github.com/bhargavibairagoni/react-django-deployment.git'
        }
    }
    stage("dependency") {
      steps{
        sh '''
        sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        docker-compose version'''
      }
    }
    stage("build") {
        steps {
            sh 'docker-compose up --build'
        }
    }
  }
}
          
