pipeline{
    agent any
    tools{
        maven 'Maven-3.9.3'
    }
    stages{
        stage('Build maven project'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dmnglor/springboot-sample']])
                bat 'mvn clean install'
        }
    }
    stage('Build Docker image'){
        steps{
            script{
                bat 'docker build -t dayalathakodagi/springboot-sample .'
            }
        }
    }
    stage('Push image to Docker Hub'){
	        steps{
	            script{
	                withCredentials([string(credentialsId: 'sampledocker-pwd', variable: 'sampledockerpwd')]) {
					//bat 'docker login -u dayalathakodagi -p ${sampledockerpwd}'
				       type password.txt | docker login --username dayalathakodagi --password-stdin

				}
                    bat 'docker push dayalathakodagi/springboot-sample'
	            }
	        }
	    }
    
}
}
