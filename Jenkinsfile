pipeline {
    environment { APP='myapp2' }    
    agent any

    stages {
        stage('Build') {
            agent { label 'maven' }
            steps {
                sh '''
                   mvn package
                '''
                buildDockerImage(semVer:true)
            }
        }
    }
}
