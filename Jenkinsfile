pipeline {
    agent any

    environment {
        NODE_VERSION = '18' // Sesuaikan dengan Node.js yang kamu butuhkan
    }

    stages {
        stage('Setup Node.js') {
            steps {
                echo 'Setting up Node.js environment...'
                script {
                    def nodejs = tool name: "NodeJS-${NODE_VERSION}", type: 'NodeJSInstallation'
                    env.PATH = "${nodejs}/bin:${env.PATH}"
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing npm packages...'
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'npm test'
            }
        }

        stage('Build and Start') {
            steps {
                echo 'Starting the app...'
                sh 'npm start &'
            }
        }
    }
}
