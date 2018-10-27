# Concourse Labs

## Prerequisites

- A instance of Concourse
- An instance of Minio (or some other S3 compatible store)
- The `fly` CLI
- The `git` CLI
- A GitHub account

## Initial Steps

1. Fork this project in GitHub: https://github.com/ssherwood/spring-music
2. Clone the forked repository to your box: ```git clone <forked repo>```
3. Verify that your Concourse is running and you can log into the UI
4. Verify that you can log in with the fly CLI (ex. ```fly -t main login -c http://concourse.pivotal-workshop.com:8080/ --insecure```)

Notes:
