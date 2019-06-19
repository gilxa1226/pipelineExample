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
            sh 'ng test --watch=false --codeCoverage=true'
            sh 'ng e2e --port 4201'
          }
        }
        stage('Code Quality') {
          steps {
            sh '''/Users/haller/Applications/sonar-scanner-3.3.0.1492-macosx/bin/sonar-scanner \\
  -Dsonar.projectKey=pipelineExample \\
  -Dsonar.sources=. \\
  -Dsonar.host.url=http://localhost:9000 \\
  -Dsonar.login=caf7e6ca5be6445c795559bc6a6edc9db1f82fe4'''
          }
        }
      }
    }
    stage('Docker') {
      steps {
        sh '''
npm install && 
ng build &&

docker build -t gilxa1226/pipelineexample .'''
        sh '''docker login &&
docker push gilxa1226/pipelineexample'''
      }
    }
    stage('Security') {
      steps {
        sh '--clair="http://127.0.0.1:6060" --ip="127.0.0.1" gilxa1226/pipelineexample:latest'
      }
    }
  }
}