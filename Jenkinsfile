pipeline {
    agent any
    stages {
        stage('Build') {
            when {
                anyOf {
                    branch 'master'
                    branch 'Develop'
                }
            }
            steps {
                echo 'Building a Docker image based on the configuration in Dockerfile...'
                echo '---- Contents of Dockerfile ---------------------------------------'
                sh 'sudo cat Dockerfile'
                echo '-------------------------------------------------------------------'
                sh 'sudo docker build . -t website:latest'
                sh 'sudo docker images'
            }
        }
        stage('Publish'){
            when {
                branch 'master'
            }
            steps {
                echo 'Checking and Stopping if there is a website container already running...'
                sh 'sudo /bin/bash $WORKSPACE/StopAlreadyRunningContainer.sh'
                sh 'sudo docker run -itd -p 82:80 website:latest'
                sh 'sudo docker ps'
            }
        }
    }
}