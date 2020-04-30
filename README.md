# Jenkins Boilerplate

## Link to blog post
```
- [Blog Post](https://medium.com/@garygeorge84/)
```

This project contains a Makefile which allows you to spin up a docker Jenkins image

## Running the project

- make build
- make run
- http://[YOUR_DOMAIN]:8888/


## Allow server to talk to docker hub to get image

- ssh into server
- sudo usermod -aG docker $USER
- sudo reboot


## Get Container Logs

- ssh into server
- docker ps -a (get container id)
- docker logs --tail 2500 container-id


## On initial running of the container

- check logs and get the admin password
- once wizard install is over go to manage plugins and install 'build pipeline'


## SSH - allow Jenkins to talk to bit bucket

- ssh into server -> ssh-keygen
- copy private key paste into Jenkins credential ( cat /var/www/vhosts/[YOUR_DOMAIN]/.ssh/id_rsa )
- copy public key paste into your bitbucket repo ( cat /var/www/vhosts/[YOUR_DOMAIN]/.ssh/id_rsa.pub )
- in Jenkins pipeline config select the credential you just created in Jenkins


## Create pipeline job

- create jenkins multibranch pipeline job
- link to git repo , use ssh key added in credentials
- Under build configuration select Jenkinsfile


## Allow Jenkins to run the pipeline

- add node plugin in global tools,
- select a version of node and set the name like this: node-12-3-1
- in Jenkinsfile reference the name you gave above like this: tools {nodejs "node-12-13-1"}


## Trigger build after a commit (jenkins web hook )

On Jenkins

- install ‘bitbucket' plugin in jenkin
- create jenkins freestyle project
- under Source Code Management > connect to bitbucket git rep
- under Build Triggers > select Build when a change is pushed to BitBucke
- under Build > select pipeline job to be triggered

On Bitbucket

- go to repo select > settings > web hooks
- give a title then give a url of : http://[YOUR_DOMAIN]:8888/bitbucket-hook/
- select > trigger on repository push
