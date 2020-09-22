---
layout: post
title: DockerのCLIについて
category: blog
tags: Docker
summary: DockerのCLIは再構成中のようです
author: a-yoshii
---

昨日の記事で似た操作を複数の方法で呼び出せることを確認しましたが，
そもそも通常のコマンドと管理用のコマンドはどう違うのだろうと探していたら，
下記の記事を見つけました．

https://www.docker.com/blog/whats-new-in-docker-1-13/

上の記事のCLI restructedの節では，サブコマンドが増えており
補完が効かせづらかったり煩雑になってきたのでまとめるとされています．

既存のlistやhistoryといったコマンドはdocker container list, docker image history
といった形に分類されるようです．

また，環境変数DOCKER\_HIDE\_LEGACY\_COMMANDSを設定すると
Usageにて表示されるコマンドを管理用コマンドと一部のコマンドに絞ることができます．

```
$ export DOCKER_HIDE_LEGACY_COMMANDS=1

$ docker

Usage:	docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default
                           "/Users/a-yoshii/.docker")
  -c, --context string     Name of the context to use to connect to the daemon
                           (overrides DOCKER_HOST env var and default context set
                           with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level
                           ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default
                           "/Users/a-yoshii/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default
                           "/Users/a-yoshii/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default
                           "/Users/a-yoshii/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  context     Manage contexts
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  build       Build an image from a Dockerfile
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  run         Run a command in a new container
  search      Search the Docker Hub for images
  version     Show the Docker version information

Run 'docker COMMAND --help' for more information on a command.
```

次回以降は各管理用のコマンドについて調べていこうと思います．

