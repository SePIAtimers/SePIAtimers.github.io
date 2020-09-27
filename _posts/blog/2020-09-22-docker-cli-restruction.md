---
layout: blog_post
title: Dockerのサブコマンドの構成
category: blog
tags: Docker
summary: Dockerはコマンドが増えすぎたということで，サブコマンドを再構成しているようです
author: a_yoshii
---

[前回]({{ site.baseurl }}{% post_url blog/2020-09-21-docker_subcommands%})
の記事で似た操作を複数の方法で呼び出せることを確認しましたが，
そもそも通常のコマンド(Commands)と管理用のコマンド(Management Commands)
はどう違うのだろうと探していたら，下記の記事を見つけました．

[Introducing Docker 1.13](https://www.docker.com/blog/whats-new-in-docker-1-13/)

この記事はDockerの公式ブログでDocker 1.13の変化点について記載されている記事です．
この中の"CLI restructed"の節で，サブコマンドが増えて補完が効かせづらかったり煩雑になってきたのでまとめると書かれています．

この記事を読んだときは，通常のコマンドをすべて管理用のコマンドに集約するのかと思いましたが，
普段Dockerを使っていてコマンドが利用できなくなるといった警告は見たことがないので結局どちらを使えばよいのだろう？
と考えつつ公式ドキュメントを眺めていると，通常のコマンドを隠す環境変数が用意されていることに気づきました．

[Use the Docker command line#Environment variables](https://docs.docker.com/engine/reference/commandline/cli/#environment-variables)

環境変数DOCKER\_HIDE\_LEGACY\_COMMANDSを設定すると
Usageにて表示されるコマンドを管理用コマンドと一部のコマンドに絞ることができます．

通常時のUsageの表示

```sh
$ docker

Usage:	docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/home/USERNAME/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set
                           with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/home/USERNAME/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/home/USERNAME/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/home/USERNAME/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  context     Manage contexts
  engine      Manage the docker engine
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
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.
```

---

環境変数設定時のUsageの表示

```sh
$ DOCKER_HIDE_LEGACY_COMMANDS=1 docker

Usage:	docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/home/USERNAME/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set
                           with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/home/USERNAME/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/home/USERNAME/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/home/USERNAME/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  context     Manage contexts
  engine      Manage the docker engine
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

上で見比べてみるとわかりますが，かなりの数の通常コマンドが非表示になっています．
ですが，全てのコマンドが管理用のコマンドに集約されるわけではないようで，
build, run, searchといった頻繁に使うコマンドは非表示になっていません．


次回以降は各管理用のコマンドについて勉強がてら1つずつ調べていこうと思います．
