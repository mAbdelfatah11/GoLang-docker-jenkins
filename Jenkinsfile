pipeline {
    agent any
    tools {
        go 'go1.18'
    }
    environment {
        GO111MODULE = 'on'
    }
    stages {
        stage('Compile to artifact') {
            steps {
		sh 'go get ./...'
		//sh 'go test ./...'
		sh 'go build -v .'

            }
        }
    
        stage('build push docker image'){
    	    steps{
		   echo "building the docker image..."
		   withCredentials([usernamePassword(credentialsId: 'Dockerhub-Credentails', passwordVariable: 'PASS', usernameVariable: 'USER')]){
			sh "docker build -t mabdelfatah/goviolin:v0.0.0 ."
			sh "echo $PASS | docker login -u $USER --password-stdin"
			sh "docker push mabdelfatah/goviolin:v0.0.0"
		    	    
    	    }	
    	
    	}
    }
}

    post {
      failure {
        emailext (
          body: '${DEFAULT_CONTENT}', mimeType: 'text/plain',
          subject: "${env.JOB_NAME} #${env.BUILD_NUMBER} [${currentBuild.result}]",
          replyTo: '$DEFAULT_REPLYTO <mahmoud.abdelfatah707@gmail.com>',
          to: emailextrecipients([[$class: 'CulpritsRecipientProvider'],
          [$class: 'RequesterRecipientProvider']])
          )
        }
      }


}

