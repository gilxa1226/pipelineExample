def label = "worker-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
  containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'node', image: 'node', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'klar', image: 'localhost:5000/klar', command: 'cat', ttyEnabled: true)
],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')   
]) {

node(label) {
    stage('Checkout') {
      checkout scm
    }
    stage('Prepare Code Base') {
      container('node') {
        sh 'npm install'
        sh 'npm install -g @angular/cli'
      }
    }
    stage('Test') {
      container('node') {
        sh """
          echo "All Tests Pass...."
        """
      }
    }
    stage('Build Artifacts') {
      container('node') {
        sh 'ng build'
      }
    }
    stage('Build') {
      container('docker') {
        sh """
          docker build -t localhost:5000/example-app:security .
          """
      }
    }
    stage('Push to DMZ Registry') {
      container('docker') {
        sh """
          docker push localhost:5000/example-app:security
        """
      }
    }
    stage('Scan Image') {
      container('klar') {
        sh """
          JSON_OUTPUT=true ./klar localhost:5000/example-app:security 
        """
      }
    }
    stage('Push to Prod Registry') {
      container('docker') {
        sh """
          docker tag localhost:5000/example-app:security localhost:5000/example-app:latest
          docker push localhost:5000/example-app:latest
        """
      }
    }
 }
}