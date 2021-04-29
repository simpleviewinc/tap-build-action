# Overview
`tap-build-action` is a reusable github action that uses the [keg-cli](https://github.com/simpleviewinc/keg-cli) to build any tap's docker package and submit it to github registry. 

For more information on taps and the keg, see [keg-hub](https://github.com/simpleviewinc/keg-hub)

# Usage

```yml
- uses: simpleviewinc/tap-build-action@0.0.1
  with:
    # The keg-cli git branch to use for building and pushing the image.
    #
    # Default: 'develop'
    cli_git_branch: ''

    # The git ref of the tap to checkout.
    # When checking out the repository that triggered a workflow, this 
    # defaults to the reference or SHA for that event. 
    # 
    # NOTE: This has to be a branch ref. Tags will not work.
    #
    # Example: /ref/heads/my-feature-branch
    # Default: ${{ github.ref }}
    tap_ref: ''

    # Repository name with owner. 
    #
    # Example: simpleviewinc/tap-events-force
    # Default: ${{ github.repository }}
    repository: ''


    # This action will tag your tap's built image with this tag name.
    # 
    # Default: 'develop'
    tag: ''

    # Personal access token (PAT) used to fetch the repository and push its image. 
    # We recommend using a service account with the least permissions necessary.
    # Also when generating a new PAT, select the least scopes necessary.
    #
    # Default: ${{ github.token }}
    token: ''

    # The username to use for logging into the docker registry 
    # with the docker-cli
    #
    # Default: 'keg-admin'
    user: ''
```
