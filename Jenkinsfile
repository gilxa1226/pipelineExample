pipeline {
  agent any
  stages {
    stage('Prepare Code Base') {
      steps {
        sh 'npm install'
      }
    }
    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            sh 'ng test --watch=false'
            sh 'ng e2e --port 4201'
          }
        }
        stage('Code Quality') {
          steps {
            sh '''/Users/haller/Applications/sonar-scanner-3.3.0.1492-macosx/sonar-scanner \\
  -Dsonar.projectKey=pipelineExample \\
  -Dsonar.sources=. \\
  -Dsonar.host.url=http://localhost:9000 \\
  -Dsonar.login=caf7e6ca5be6445c795559bc6a6edc9db1f82fe4'''
          }
        }
      }
    }
  }
}