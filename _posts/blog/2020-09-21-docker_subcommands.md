---
layout: post
title: Dockerのコマンド，重複がある？
category: blog
tags: Docker
summary: Dockerのサブコマンド一覧を眺めて見る
author: a-yoshii
---

普段，環境の共有や管理を理由としてDockerを使うことは多いと思いますが，Dockerのサブコマンドを一通り把握されている方は多くないのではないでしょうか．
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

...

-v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs

...

  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile

...

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
ヘルプメッセージを見る限りは同じコマンドに見えますが，
本当に同じ操作なのかをこれから確認していこうと思います．
