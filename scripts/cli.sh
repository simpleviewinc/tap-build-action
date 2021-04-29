
clone_cli () {
  echo "==== Cloning Keg-CLI branch $INPUT_CLI_BRANCH"
  git -C $ACTION_WORKSPACE clone --single-branch --branch $INPUT_CLI_BRANCH https://github.com/simpleviewinc/keg-cli.git

  return $?
}

install_cli () {
  echo "==== Installing Keg-CLI dependencies..." 
  cd $ACTION_WORKSPACE/keg-cli
  echo "====>>>> CLI BRANCH: $(git branch); PWD: $(pwd)"
  yarn install
  return $?
}

setup_cli () {
  cd $ACTION_WORKSPACE/keg-cli

  KEG_ROOT_DIR=$ACTION_WORKSPACE/keg-hub \
    bash scripts/ci/setupCLIConfig.sh

  return $?
}

clone_cli || { echo 'Clone failed' ; exit 1; }
install_cli || { echo 'Install failed' ; exit 1; }
setup_cli || { echo 'Install failed' ; exit 1; }