# github-runner
Docker container for Github Action Runners

## Run gibhub-runner in a container
```
docker run --rm -e GHREPO=https://github.com/my/repo -e GHTOKEN=XXXX raynix/github-runner
```

## Troubleshooting
```
docker run --rm -ti -e GHREPO=https://github.com/my/repo -e GHTOKEN=XXXX --entrypoint bash raynix/github-runner
```
