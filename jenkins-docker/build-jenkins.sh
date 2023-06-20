docker build -t jenkins-blueocean-imagen .

docker run \
  --name jenkins-blueocean \
  --restart=on-failure \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --env JENKINS_OPTS=--httpPort=8081 \
  --publish 8081:8081 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  jenkins-blueocean-imagen