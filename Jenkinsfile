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
        stage ('Code Qualty Scan') {
            
           steps {
                  withSonarQubeEnv('sonarserver') {
             sh "mvn -f MywebApp/pom.xml sonar:sonar"      
               }
            }
       }

        stage('Deploy to tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: '2bb399ca-255a-4bd3-b172-a5bfd31f6cba', path: '', url: 'http://35.174.106.73:8080/')], contextPath: 'myapp', war: '**/*.war'
            }
        }
    }
}
