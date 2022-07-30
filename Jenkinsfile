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
        stage('push to Nexus') {
          steps {    
             nexusArtifactUploader artifacts: [[artifactId: 'SampleWebApp', classifier: '', file: 'SampleWebApp/target/SampleWebApp.war', type: 'war']], credentialsId: 'nexus', groupId: 'SampleWebApp', nexusUrl: '18.234.99.93:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshot', version: '1.0-SNAPSHOT'      
          }
            
        }
        stage('Deploy to tomcat') {
           steps {
               deploy adapters: [tomcat9(credentialsId: '62fde4ec-bb41-46ec-acfd-a39c5c5fcd48', path: '', url: 'http://3.82.157.142:8080/')], contextPath: 'myapp', war: '**/*.war'
            }
        }
    }
}
