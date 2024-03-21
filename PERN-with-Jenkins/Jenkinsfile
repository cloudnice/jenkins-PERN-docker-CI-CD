pipeline {
    agent any
    stages {
        stage('Deploy the App') {
            steps {
                echo 'Deploy the App'
                sh 'ls -l'
                sh 'docker --version'
                // sh 'docker-compose build'
                // sh 'docker-compose up --build' 
                timeout(time: 2, unit: 'MINUTES') {
                    sh 'docker-compose up -d'
                }
            }
        }
        stage('Destroy the infrastructure') {
            steps {
                timeout(time: 5, unit: 'DAYS') {
                    input message: 'Approve terminate'
                }
                sh 'docker-compose down' 
                // sh 'docker-compose down -v' 
            }
        }
    }

    // post {
    //     success {
    //         script {
    //             slackSend channel: '#class-chat', color: '#439FE0', message: '🌶️ All_PROCESS_DONE!!! 🌶️', teamDomain: 'devops15tr', tokenCredentialId: '207'
    //         }
    //     }
    // } 
}
