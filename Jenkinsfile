pipeline {
    agent any

    environment {
        DOCKERHUB_USER = "cloudnice"
        APP_REPO_NAME = "todo-app"
        DB_VOLUME = "myvolume"
        NETWORK = "mynet"
    }

    stages {
        stage('Build App Docker Image') {
            steps {
                echo 'Building App Image'
                    // sh 'docker build --force-rm -t "$DOCKERHUB_USER/$APP_REPO_NAME:postgre" -f ./database/Dockerfile .'
                    // sh 'docker build --force-rm -t "$DOCKERHUB_USER/$APP_REPO_NAME:nodejs" -f ./server/Dockerfile .'
                    // sh 'docker build --force-rm -t "$DOCKERHUB_USER/$APP_REPO_NAME:react" -f ./client/Dockerfile .'
                    sh 'docker image ls'
            }
        }

        stage('Push Image to DockerHub Repo') {
            steps {
                echo 'Pushing App Image to Dockerhub Repo'
                withCredentials([string(credentialsId: 'DOCKERHUB_TOKEN', variable: 'DOCKERHUB_TOKEN')]) {
                sh 'docker container ls && docker images && docker network ls && docker volume ls'
                // sh 'docker login -u $DOCKERHUB_USER -p $DOCKERHUB_TOKEN'
                // sh 'docker push "$DOCKERHUB_USER/$APP_REPO_NAME:postgre"'
                // sh 'docker push "$DOCKERHUB_USER/$APP_REPO_NAME:nodejs"'
                // sh 'docker push "$DOCKERHUB_USER/$APP_REPO_NAME:react"'
                 }    
            }
        }

        stage('Create Volume') {
            steps {
                echo 'Create Volume'
                sh 'docker volume create $DB_VOLUME'
            }
        }

        stage('Create Network') {
            steps {
                echo 'Create Network'
                sh 'docker network create $NETWORK'
            }
        }

        stage('Deploy the Database') {
            steps {
                withCredentials([string(credentialsId: 'POSTGRES_PASSWORD', variable: 'POSTGRES_PASSWORD')]) {
                    echo 'Deploy the Database'
                    sh 'docker run --name db -p 5432:5432 -v $DB_VOLUME:/var/lib/postgresql/data --network $NETWORK -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD --restart always -d $DOCKERHUB_USER/$APP_REPO_NAME:postgre'
                }
            }
        }

        stage('wait the instance db') {
            steps {
                script {
                    echo 'Waiting for the db container'
                    sh 'sleep 30'
                }
            }
        }

        stage('Deploy the server') {
            steps {
                echo 'Deploy the server'
                sh 'docker run --name server -p 5000:5000 --network $NETWORK --restart always -d $DOCKERHUB_USER/$APP_REPO_NAME:nodejs'
            }
        }

        stage('wait the instance server') {
            steps {
                script {
                    echo 'Waiting for the server container'
                    sh 'sleep 30'
                }
            }
        }

        stage('Deploy the client') {
            steps {
                echo 'Deploy the server'
                sh 'docker run --name client -p 3000:3000 --network $NETWORK --restart always -d $DOCKERHUB_USER/$APP_REPO_NAME:react'
            }
        }

        stage('Destroy the infrastructure') {
            steps {
                timeout(time: 5, unit: 'DAYS') {
                    input message: 'Approve terminate'
                }
                // sh 'docker rm -f $(docker container ls -aq)'
                // sh 'docker network rm $NETWORK'
                // sh 'docker volume rm $DB_VOLUME'
                sh 'docker container ls && docker images && docker network ls && docker volume ls'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up'
            script {
                sh 'docker rm -f $(docker container ls -aq)'
                // sh 'docker rmi -f $(docker images -q)'
                sh 'docker network rm $NETWORK'
                sh 'docker volume rm $DB_VOLUME'
            }
        }

        success {
            echo 'Pipeline executed successfully'
        }

        failure {
            echo 'Pipeline failed. Cleaning up containers, images, network, and volume.'
        }
    }
}
