node('master') {
    stage ('Clone') {
    	checkout scm
    }
	stage('Build') {
		dir('web') {
			sh "./build-docker.sh ${BUILD_NUMBER}"
			sh "./push.sh ${BUILD_NUMBER}"
		}
	}
	stage('Testing') {
		sh "./run-docker-jenkins.sh ${BUILD_NUMBER}"
	}
}