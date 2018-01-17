pipeline {
    stage ('Clone') {
    	checkout scm
    }
	stage('Build') {
		sh "cd web"
		sh "./build-docker.sh ${BUILD_NUMBER}"
		sh "./push.sh ${BUILD_NUMBER}"
	}
	stage('Testing') {
		sh "./run-docker-jenkins.sh ${BUILD_NUMBER}"
	}
}