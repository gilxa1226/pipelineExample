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
            withSonarQubeEnv(installationName: 'SonarQubePipelineExample', credentialsId: 'caf7e6ca5be6445c795559bc6a6edc9db1f82fe4') {
              waitForQualityGate(abortPipeline: true, credentialsId: 'caf7e6ca5be6445c795559bc6a6edc9db1f82fe4')
            }

          }
        }
      }
    }
  }
}