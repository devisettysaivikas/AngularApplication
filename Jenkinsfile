pipeline {
    environment {
        registry = "devisettysaivikas"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
  agent {
        label "my-slave"
    }
    stages {
        stage('Building our image') {
            steps {
                script {
                    dockerImage = docker.build registry +"/sampleimage"+ ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
