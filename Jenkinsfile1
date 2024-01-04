pipeline{
   agent any
   environment {
        DOCKER_USERNAME = 'usename'
        DOCKER_PASSWORD = 'passwd'
        DOCKER_IMAGE = 'myimage:latest'
        PORT_MAPPING = '8080:80'
    }
       stages{
        stage('download'){
          steps{
            checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bvenkydevops/mavenrepo-master.git']])
          }
       }
       stage('build'){
           steps{
               sh 'mvn clean package'
           }
       }
       stage('codeQualitycheck'){
           steps{
              sh 'mvn sonar:sonar' 
           }
       }
       stage('artifactUpload'){
           steps{
               sh 'mvn deploy'
           }
       }
       stage('deploy'){
           steps{
               script{
                sh "echo $DOCKER_PASSWORD | docker login --username=$DOCKER_USERNAME --password-stdin"
                sh "docker build -t $DOCKER_USERNAME/myimage:latest ."
                sh "docker push $DOCKER_USERNAME/myimage:latest"
                sh "docker build -t $DOCKER_IMAGE ."
                sh "docker run -p $PORT_MAPPING -d $DOCKER_IMAGE"
               }
           }
       }
    }
}
