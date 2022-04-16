pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                git 'https://github.com/tkibnyusuf/realone-repo.git'
            }
        }
        
        stage('Build with maven') {
            steps {
                sh 'cd SampleWebApp && mvn clean package'
            }
        }
        
             stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        
            }

        stage('Deploy to tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'ddde4cf3-7f90-4926-b906-9eec9a511b26', path: '', url: 'http://54.144.59.1:8080/')], contextPath: 'mywebapp', war: '**/*.war'
            }
        }
    }
}
