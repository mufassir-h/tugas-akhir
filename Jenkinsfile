pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Start App') {
            steps {
                sh '''
                    nohup npm start > output.log 2>&1 &
                '''
            }
        }
    }
}
