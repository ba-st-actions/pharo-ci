# Pharo CI

A docker-based GitHub action to load and test code in a Pharo image using smalltalkCI.

This is a community project using the unofficial docker images available [here](https://github.com/ba-st/docker-pharo-runtime).

## Quick start

Create a workflow file in your project on `.github/worfklows` using this action.

```yml
name: 'Unit Tests'
on:
  - push
  - pull
  - workflow_dispatch
jobs:
  testing:
    runs-on: ubuntu-latest
    name: Unit Tests
    steps:
      - uses: actions/checkout@v6
      - name: Load code and run tests
        uses: ba-st-actions/pharo-ci@v11
        with:
          spec: '.smalltalkci/unit-tests.ston'
```

- `v10` supports Pharo 10
- `v11` supports Pharo 11

When running, the workflow will map the `{GITHUB_WORKSPACE}` directory of the
runner inside the container.

## Supported inputs

- `smalltalkci_branch` branch of smalltalkCI to download.
  Optional, defaults to `master`
- `smalltalkci_repo` fork of smalltalkCI to download.
  Optional, defaults to `hpi-swa/smalltalkCI`
- `spec` Relative path in the project structure to the smalltalkCI spec to run.
  Optional, defaults to `.smalltalk.ston`

## Running the action locally

```bash
docker run --name pharo-ci --rm \
  -v {{repo_path}}:/workspace \
  -e GITHUB_WORKSPACE=/workspace \
  -e INPUT_SPEC=.smalltalkci/.unit-tests.ston \
  ghcr.io/ba-st-actions/pharo-ci:v11
```

replacing `{{repo_path}}` with the path of the repo under test in the local filesystem
