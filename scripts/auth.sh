source $ACTION_WORKSPACE/keg-cli/keg

set_docker_user () {
  keg config set key=docker.user value=$INPUT_USER --confirm false
}

set_git_user () {
  git config --global user.name $INPUT_USER
}

docker_login () {
  GIT_KEY=$INPUT_TOKEN keg dp login 
}

set_docker_user
set_git_user
docker_login