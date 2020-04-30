build:
	@docker pull jenkins/jenkins:2.206
run:
	@docker run -p 8080:8080 --name=jenkins-boilerplate -d --env JAVA_OPTS="-Xmx8192m" --env JENKINS_OPTS="--handlerCountMax=300" -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:2.206
start:
	@docker start jenkins-boilerplate
stop:
	@docker stop jenkins-boilerplate
clean:	stop
	@docker rm -v jenkins-boilerplate
