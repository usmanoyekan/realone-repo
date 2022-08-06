pipeline {
    agent any
    environment {
        VERSION = "${env.BUILD_ID}"
    }
    stages {
        stage('Git checkout') {
            steps {
                git 'https://github.com/tkibnyusuf/realone-repo.git'
            }
        }
        
        stage('Build with maven') {
            steps {
                sh 'cd SampleWebApp && mvn clean install'
            }
        }
        
             stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        
            }
        
        stage("docker build & docker push"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker-password', variable: 'docker_pass')]) {
                             sh '''
                                sudo docker build -t 3.82.250.85:8083/springapp:${VERSION} .
                                sudo docker login -u admin -p $docker_pass 3.82.250.85:8083
                                sudo docker push  3.82.250.85:8083/springapp:${VERSION}
                                sudo docker rmi 3.82.250.85:8083/springapp:${VERSION}
                            '''
                       }
                    }
                }
            }
        }
    }
