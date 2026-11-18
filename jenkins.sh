pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Fetching source code...'
            }
        }
        stage('Build') {
            steps {
                echo 'Compiling and packaging the application...'
                sh 'sleep 2'
            }
        }
        stage('Test') {
            steps {
                echo 'Running automated unit tests...'
                sh 'echo "All tests passed!"'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application to staging server...'
            }
        }
    }
    post {
        success {
            echo 'Demo pipeline completed successfully!'
        }
    }
}

