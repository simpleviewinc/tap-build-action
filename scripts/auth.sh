set -e
source $ACTION_WORKSPACE/keg-cli/keg

set_creds () {
  keg config set key=docker.user value=$INPUT_USER --confirm false
  keg git key add value=$INPUT_TOKEN
}

set_git_user () {
  git config --global user.name $INPUT_USER
}

docker_login () {
  keg dp login 
}

set_creds
set_git_user
docker_login