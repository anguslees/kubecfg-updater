# Update Your K8s Cluster from Git

This is a deliberately simple tool to keep your Kubernetes cluster up to date with YAML/JSON configs stored in git.  It clones your git repository and periodically runs `kubectl apply --recursive` on a repository subdirectory.

See [example deployment.yaml](https://github.com/anguslees/kubecfg-updater/blob/master/deployment.yaml). You need to set at least the `GIT_REPO` env variable to point to your git repository.

## Environment variables

`GIT_REPO` - Git repository containing k8s resource configs.

`GIT_BRANCH` - Git branch or tag to track, defaults to `origin/master`.

`UPDATE_SUBDIR` - Run kubectl recursively on all JSON/YAML files in subdirectory (relative to `GIT_REPO`).

`UPDATE_PERIOD` - Delay between loop iterations.  Defaults to 600 seconds (10 minutes).
