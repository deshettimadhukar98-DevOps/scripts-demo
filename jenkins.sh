pipeline {
    agent any

    environment {
        APP_NAME = 'demo-service'
        DEPLOY_ENV = 'staging'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Fetching source code for ${env.APP_NAME}..."
                // Uncomment the line below to pull from a real Git repo:
                // git branch: 'main', url: 'https://github.com'
            }
        }

        stage('Build') {
            steps {
                echo 'Compiling application...'
                sh 'echo "Build successful" > artifact.txt'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests...'
                sh 'cat artifact.txt'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying ${env.APP_NAME} to ${env.DEPLOY_ENV}..."
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Pipeline failed. Check console logs for details.'
        }
        always {
            cleanWs() // Cleans up the workspace after the run
        }
    }
}
