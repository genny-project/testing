node('master') {
	stage('Build') {
		sh "web/build-docker.sh"
	}
	stage('Testing') {
		sh "web/run-docker-jenkins.sh"
	}
}