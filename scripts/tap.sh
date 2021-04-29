set -e
source $ACTION_WORKSPACE/keg-cli/keg

export TAPS_DIR=$ACTION_WORKSPACE/keg-hub/taps
export TAP_BRANCH=${INPUT_TAP_REF##*/}
export TAP_NAME=$(basename $INPUT_REPOSITORY)
export TAP_PATH=$TAPS_DIR/$TAP_NAME

clone_tap () {
  echo "==== Cloning Tap with branch $TAP_BRANCH"
  git -C $TAPS_DIR clone --single-branch --branch $TAP_BRANCH https://github.com/$INPUT_REPOSITORY
}

install_tap () {
  echo "==== Installing tap dependencies"
  cd $TAP_PATH
  yarn install
}

link_tap () {
  cd $TAP_PATH
  echo "==== Linking tap"
  keg tap link
}

build_push_tap () {
  echo "==== Building and pushing tap"
  GIT_KEY=$INPUT_TOKEN keg $TAP_NAME build --push --tag $INPUT_TAG --no-cache
}

clone_tap
link_tap
install_tap
build_push_tap