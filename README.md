# jmm-mh-th

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

