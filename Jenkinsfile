pipeline {
    agent any
    tools {
        go 'go1.18'
    }
    environment {
        GO111MODULE = 'on'
    }
    stages {
        stage('Compile') {
            steps {
                sh 'go build -v .'
            }
        }
    
        stage('build'){
    	    steps{
    	    	sh 'echo "$DOCKER_PASSWORD" | docker login  --username "$DOCKER_USERNAME" --password-stdin'
		//sh 'docker pull $DOCKER_USERNAME/mathapp-production:latest'
		sh 'docker build -f Dockerfile -t $DOCKER_USERNAME/goviolin-production .'
		sh 'docker push $DOCKER_USERNAME/goviolin-production'
    	    
    	    }	
    	
    	}
    	}
}

