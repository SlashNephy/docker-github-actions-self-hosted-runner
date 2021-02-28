# docker-github-actions-self-hosted-runner
🐋 Docker image: Ubuntu based self-hosted runner for GitHub Actions

[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/slashnephy/github-actions-self-hosted-runner/latest)](https://hub.docker.com/r/slashnephy/github-actions-self-hosted-runner)

`docker-compose.yml`

```yaml
version: '3.8'

services:
  runner:
    container_name: self-hosted-runner
    image: slashnephy/github-actions-self-hosted-runner:latest
    restart: always
    environment:
      TZ: Asia/Tokyo
      # You can find these values in https://github.com/organizations/***/settings/actions/add-new-runner
      RUNNER_URL: https://github.com/xxx
      RUNNER_TOKEN: xxx
```
