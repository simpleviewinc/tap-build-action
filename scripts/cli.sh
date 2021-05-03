set -e

clone_cli () {
  echo "==== Cloning Keg-CLI branch $INPUT_CLI_GIT_BRANCH"
  git -C $ACTION_WORKSPACE clone --single-branch --branch $INPUT_CLI_GIT_BRANCH https://github.com/simpleviewinc/keg-cli.git
}

install_cli () {
  echo "==== Installing Keg-CLI dependencies..." 
  cd $ACTION_WORKSPACE/keg-cli
  yarn install
}

setup_cli () {
  cd $ACTION_WORKSPACE/keg-cli

  KEG_ROOT_DIR=$ACTION_WORKSPACE/keg-hub \
    bash scripts/ci/setupCLIConfig.sh
}

# Set the path ENV for the global config
# Because `scripts/ci/setupCLIConfig.sh` gets called with `bash` and not `source` || `.`
# Any envs exported from the script are not loaded in this session
# Even though line 44 of `setupCLIConfig.sh` exports the `KEG_GLOBAL_CONFIG`, we can't access it
# Instead of setting this ENV here, we could update line 18 of this file
# to use `source` instead of `bash`
export KEG_GLOBAL_CONFIG=$ACTION_WORKSPACE/keg-cli/.kegConfig/cli.config.json

clone_cli
install_cli
setup_cli