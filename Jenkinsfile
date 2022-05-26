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
		    echo "building the docker image..."
		    withCredentials([usernamePassword(credentialsId: 'Dockerhub-Credentails', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
			sh "docker build -t mabdelfatah/goviolin:v0.0.0 ."
			sh "echo $PASS | docker login -u $USER --password-stdin"
			sh "docker push mabdelfatah/goviolin:v0.0.0"
		    	    
    	    }	
    	
    	}
    	}
}

