pipeline {
  agent any
  stages {
    stage ("code") {
      git ''
    }
    stage ("build") {
      sh 'docker-compose up --build'
    }
  }
}
          
