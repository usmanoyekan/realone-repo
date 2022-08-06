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
    }
}
