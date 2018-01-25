pipeline {
	agent any
	triggers {
		upstream(
			upstreamProjects: 'pipeline-fanin-trigger', 
			threshold: hudson.model.Result.SUCCESS
		)
	}
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