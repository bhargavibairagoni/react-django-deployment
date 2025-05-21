pipeline {
  agent any
  stages {
    stage ("code") {
      git 'https://github.com/bhargavibairagoni/react-django-deployment.git'
    }
    stage ("build") {
      sh 'docker-compose up --build'
    }
  }
}
          
