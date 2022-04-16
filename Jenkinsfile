pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/engrbayo/demo-repository.git']]])
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
        stage('scan with sonar') {
            steps {
                withSonarQubeEnv('sonar') {
                sh "${mvnHome}/bin/mvn -f SampleWebApp/pom.xml sonar:sonar"
        }
            }
                 }
        stage('Deploy to tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'bfbc1a51-dbf2-43cb-adf8-8badbd2cae9d', path: '', url: 'http://3.89.187.211:8080/')], contextPath: 'myapp', war: '**/*.war'
            }
        }
    }
}
