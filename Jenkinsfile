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
        
        stage('push to Nexus') {
          steps {    
             nexusArtifactUploader artifacts: [[artifactId: 'SampleWebApp', classifier: '', file: 'SampleWebApp/target/SampleWebApp.war', type: 'war']], credentialsId: '', groupId: 'SampleWebApp', nexusUrl: '44.201.23.130:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '1.0-SNAPSHOT'      
          }
            
        }
        stage('Deploy to tomcat') {
           steps {
               deploy adapters: [tomcat9(credentialsId: '2bb399ca-255a-4bd3-b172-a5bfd31f6cba', path: '', url: 'http://35.174.106.73:8080/')], contextPath: 'myapp', war: '**/*.war'
            }
        }
    }
}
