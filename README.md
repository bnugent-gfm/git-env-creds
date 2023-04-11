# Docker & Private GitHub Repos

This is a PoC on injecting GitHub creds into a docker container using a custom git credential helper and environment variables. Should work with other git hosts that support username/password auth.

## Build
Build the PoC image like so:

```
docker build -t git-creds-poc .
```

## Run
To try it out, generate a read-only GitHub Personal Access Token (PAT) to a private repo you own. Then run the image you just built and try to clone the repo.

```
$ cat > .env <<EOF
GITHUB_USER=exampleuser
GITHUB_PAT=github_pat_abcdef12345
EOF

$ docker run --rm -ti --env-file .env git-creds-poc bash

# git clone https://github.com/exampleuser/private-repo.git
```

## Warning
It's a security risk to put secrets in environment variables. Make sure your token is least-privilege and you have multi-layered security controls wherever you run containers. 
