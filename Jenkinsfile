pipeline {
	agent any
	stages {
	    stage ('Clone') {
		    steps {
		    	checkout scm
		    }
	    }
		stage('Build') {
			steps {
				dir('web') {
					sh "./build-docker.sh ${BUILD_NUMBER}"
					sh "./push.sh ${BUILD_NUMBER}"
				}		
			}
		}
		stage('Testing') {
			steps {
				dir('web') {
					sh "./run-docker-jenkins.sh ${BUILD_NUMBER}"
				}
			}
		}	
	}
	post {
		success: {
			sh "./slack.sh https://hooks.slack.com/services/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 good Robot says: Build ${BUILD_NUMBER} Success!"
		}
		failure: {
			sh "./slack.sh https://hooks.slack.com/services/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 good Robot says: Build ${BUILD_NUMBER} Success!"
		}
	}
}