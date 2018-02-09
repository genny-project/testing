PWD=`pwd`

docker pull gennyproject/robot:latest
docker run -e WEB_URL=$WEB_URL -e KEYCLOAKURL=https://bouncer.outcome-hub.com/auth/admin/master/console/ -e BROWSER=chrome -e SLACK_WEBHOOK=https://hooks.slack.com/ -v $PWD/reports:/opt/robotframework/reports gennyproject/robot:latest
