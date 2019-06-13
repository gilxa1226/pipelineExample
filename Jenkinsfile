pipeline {
  agent {
    node {
      label 'npminstall'
    }

  }
  stages {
    stage('npm install') {
      steps {
        sh 'npm install'
      }
    }
  }
}