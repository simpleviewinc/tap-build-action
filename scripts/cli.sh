clone_cli () {
  git -C $ACTION_WORKSPACE clone --single-branch --branch $INPUT_CLI_BRANCH https://github.com/simpleviewinc/keg-cli.git
}

install_cli () {
  yarn --cwd $ACTION_WORKSPACE/keg-cli install
}

setup_cli () {
  cd $ACTION_WORKSPACE/keg-cli
  KEG_HUB_BRANCH=${INPUT_REF##*/} KEG_ROOT_DIR=$ACTION_WORKSPACE/keg-hub bash scripts/ci/setupCLIConfig.sh
}

clone_cli
install_cli