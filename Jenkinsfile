pipeline {
    agent any

    environment {
        IMAGE = "square-app:${BUILD_NUMBER}"
    }

    stages {
        stage('Fetch Code from GitHub') {
            steps {
                git branch: 'main', url: 'https://github.com/niranjanmore1/square-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run --rm $IMAGE 5 | tee output.txt'
            }
        }

        stage('Verify Output') {
            steps {
                sh '''
                    ACTUAL=$(cat output.txt)
                    EXPECTED=25
                    echo "Expected: $EXPECTED, Actual: $ACTUAL"
                    if [ "$ACTUAL" = "$EXPECTED" ]; then
                        echo "VERIFICATION PASSED"
                    else
                        echo "VERIFICATION FAILED"
                        exit 1
                    fi
                '''
            }
        }
    }

    post {
        always {
            sh 'docker rmi $IMAGE || true'
        }
    }
}
