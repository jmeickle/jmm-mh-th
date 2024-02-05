# jmm-mh-th

## Recommended

- Github Actions (VSCode Extension)
- Docker (VSCode Extension)

## Setup
1. Install poetry
```
pipx install poetry
```

## Developing

To run the app locally:

```bash
cd app
poetry shell
uvicorn app.main:app --reload
```

Codespaces forwarding will open a prompt to show the app on a local browser:

![Local browser view](docs/images/local_browser.png)

## Deploying

To build a deployable Docker image, you can run:
```bash
docker build . -t local
```

You can also push to the repo and see builds.

## Further work

- Didn't want to stand up a registry or cluster just for this, so those are no-ops
  - you could include provisioning the cluster in the Workflow too, though usually it's better to have an existing cluster to submit CI tasks to
- Which means the k8s manifest isn't actually runnable
- k8s manifest uses a ClusterIP which generally won't work and is a bad idea for 443 anyways (privileges + contention); in a real world scenario you'd want an Ingress, LB controller annotations, service mesh, whatever - any of which is more complex than the demo app in the first place!
- Running linting and tests in the GH actions pipeline, or writing any tests to run :)
- Timneouts, notifications, and other CI error handling