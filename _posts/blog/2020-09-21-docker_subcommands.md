---
layout: blog_post
title: Dockerのサブコマンドを眺めてみる
category: blog
tags: Docker
summary: Dockerのサブコマンド，いろいろあるようです
author: a_yoshii
---

普段，環境の共有や管理でDockerを利用することは多いと思いますが，イメージのビルド，コンテナの起動や停止といった基本的な操作がほとんどで，Dockerのサブコマンドを一通り把握されている方は多くないのではないでしょうか．

私も普段は基本的な操作のみだったのですが，ふとDockerのUsageを覗くと想像より多数のコマンドがあることを知りました．
DockerのUsageを確認すると下記のように，多彩なオプションとコマンドが用意されていることを確認できます．

```sh
$ docker

Usage:	docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default
                           "/Users/USERNAME/.docker")
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

今回確認して初めて気づいたのですが，どうやら管理用のコマンド(Management Commands)と通常のコマンド(Commands)は区別されているようです．

---

試しに，管理用コマンドのbuilderを確認してみます．

```sh
$ docker builder

Usage:	docker builder COMMAND

Manage builds

Commands:
  build       Build an image from a Dockerfile
  prune       Remove build cache

Run 'docker builder COMMAND --help' for more information on a command.
```

builderコマンドはさらに次のコマンドを受け付けるようです．

---

試しにdocker builder buildコマンドを確認してみます．

```sh
$ docker builder build
"docker builder build" requires exactly 1 argument.
See 'docker builder build --help'.

Usage:  docker builder build [OPTIONS] PATH | URL | -

Build an image from a Dockerfile
```

この出力は見覚えがある方は多いのではないでしょうか．
docker buildコマンドを確認してみましょう．

```sh
$ docker build
"docker build" requires exactly 1 argument.
See 'docker build --help'.

Usage:  docker build [OPTIONS] PATH | URL | -

Build an image from a Dockerfile
```

コマンド名以外の記述が同じですね．
どうやら，Dockerのコマンドは似た(同じ?)操作でもいくつかのコマンドの打ち方があるようです．
Usageを見る限りは同じコマンドに見えますが，
本当に同じ操作なのかを次回以降に確認していこうと思います．
