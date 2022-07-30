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
                sh 'cd SampleWebApp && mvn clean install'
            }
        }
        
             stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        
            }
        stage('Code Qualty Scan') {

           steps {
                  withSonarQubeEnv('sonarserver') {
             sh "mvn -f SampleWebApp/pom.xml sonar:sonar"      
               }
            }
       }
        stage('Quality Gate') {
          steps {
                 waitForQualityGate abortPipeline: true
              }
        }
        stage('Deploy to tomcat') {
           steps {
               deploy adapters: [tomcat9(credentialsId: 'f6da5025-f188-41cd-9bbd-6c1c92c0cf57', path: '', url: 'http://3.82.157.142:8080/')], contextPath: 'myapp', war: '**/*.war'
            }
        }
    }
}
