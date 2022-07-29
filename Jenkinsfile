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
                sh 'cd SampleWebApp && clean install'
            }
        }
        
             stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        
            }

        stage('Deploy to tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'bae5600c-76c5-45f3-93bb-69797f3d5779', path: '', url: 'http://35.174.106.73:8080/')], contextPath: 'myapp', war: '**/*.war'
            }
        }
    }
}
