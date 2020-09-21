---
layout: post
title: ブログサンプル
category: blog
tags: jekyll
summary: さんぷる
---

## Docker，同じコマンドでもいくつかの呼び方がある？

普段，環境の共有や管理を理由としてDockerを使うことは多いと思いますが，Dockerのサブコマンドを一通り把握されている方は少ないのではないでしょうか．
私もそのうちの一人で，ふとDockerのサブコマンドを見てみると，想像より多数のコマンドがあることを知りました．

```
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

Dockerにはサブコマンドが多数あることは知っていましたが，どうやら管理用のコマンド(Manage Commands)と通常のコマンド(Commands)は区別されているようです．
試しに，管理用コマンドのbuilderを確認してみます．

```
$ docker builder

Usage:	docker builder COMMAND

Manage builds

Commands:
  build       Build an image from a Dockerfile
  prune       Remove build cache

Run 'docker builder COMMAND --help' for more information on a command.
```

どうやら，builderコマンドはさらに次のコマンドを受け付けるようです．
試しにbuilder buildを確認してみます．

```
$ docker builder build
"docker builder build" requires exactly 1 argument.
See 'docker builder build --help'.

Usage:  docker builder build [OPTIONS] PATH | URL | -

Build an image from a Dockerfile
```

この出力は見覚えがある方は多いのではないでしょうか．
確認してみましょう．

```
$ docker build
"docker build" requires exactly 1 argument.
See 'docker build --help'.

Usage:  docker build [OPTIONS] PATH | URL | -

Build an image from a Dockerfile
```

どうやら，Dockerのコマンドは似た操作でもいくつかのコマンドの打ち方があるようです．
ヘルプメッセージを見る限りは同じコマンドに見えますが，本当に同じ操作なのかはまだ確認できていませんが，確認していきましょう．

今回はこのへんで．

