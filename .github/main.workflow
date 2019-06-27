workflow "Build and deploy on push" {
  on = "push"
  resolves = [
    "Docker Registry",
    "Docker Push"
  ]
}

action "Docker Registry" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker Build" {
  uses = "actions/docker/cli@master"
  needs = ["Docker Registry"]
  args = "build -t  $DOCKER_USERNAME/youtube-dl ."
  secrets = ["DOCKER_USERNAME"]
}

action "Docker Tag" {
  uses = "actions/docker/tag@master"
  needs = ["Docker Build"]
  args = "$DOCKER_USERNAME/youtube-dl $DOCKER_USERNAME/youtube-dl"
  secrets = ["DOCKER_USERNAME"]
}

action "Docker Push" {
  uses = "actions/docker/cli@master"
  needs = ["Docker Tag"]
  args = "push $DOCKER_USERNAME/youtube-dl"
  secrets = ["DOCKER_USERNAME"]
}
