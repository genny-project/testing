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
	}
}
