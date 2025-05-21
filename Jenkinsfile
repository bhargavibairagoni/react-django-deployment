pipeline {
  agent any
  stages {
    stage("code") {
        steps {
            git branch: 'master', url: 'https://github.com/bhargavibairagoni/react-django-deployment.git'
        }
    }
    stage("build") {
        steps {
            sh 'docker-compose up --build'
        }
    }
  }
}
          
