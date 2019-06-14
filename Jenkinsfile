pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
    stage('Test') {
      steps {
        sh 'ng test --watch=false'
        sh 'ng e2e --port 4201'
      }
    }
  }
}