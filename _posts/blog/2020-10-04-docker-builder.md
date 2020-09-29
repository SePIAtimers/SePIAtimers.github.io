---
layout: blog_post
title: Docker Builderコマンド
category: blog
tags: Docker
summary: DockerのManagement Commands調べる Builder編
author: a_yoshii
---

[前回]({{ site.baseurl }}{% post_url blog/2020-09-22-docker-cli-restruction %})
の記事でDockerのコマンドについて1つずつ調べていくと書きましたが，今回はその1回目としてDocker Builderを確認していきます．

---

#### Docker Builder のサブコマンドを確認

まずはDocker Builderのサブコマンドを確認します．

[公式ドキュメント](https://docs.docker.com/engine/reference/commandline/builder/)

ドキュメントにはどういった意図のコマンド群かは記載されていませんが，
名前の通りDockerイメージのビルドに関するコマンドを束ねているようです．
サブコマンドとして，build, pruneの2つのコマンドが用意されています．

念の為，Usageも確認してみましょう．

```sh
$ docker builder

Usage:	docker builder COMMAND

Manage builds

Commands:
  build       Build an image from a Dockerfile
  prune       Remove build cache

Run 'docker builder COMMAND --help' for more information on a command.
```

Usageと公式ドキュメント，どちらも上記の情報以上のことは書いてないようです．

---

#### Docker Builder Buildコマンド

これは通常のDocker BuildコマンドのAliasのようです．

公式ドキュメントでは，docker builder buildとdocker build両方のページがあります．

[docker builder build](https://docs.docker.com/engine/reference/commandline/builder_build/)

[docker build](https://docs.docker.com/engine/reference/commandline/build/)

見てみるとわかりますが，builder buildコマンドよりbuildコマンドのページが圧倒的に情報が多いです．
Buildコマンドに関しては，様々な方による解説記事がいくらでも見つかると思いますので，この場では割愛します．

---

#### Docker Builder Pruneコマンド

Build Cacheを削除するコマンドです．

[docker builder prune](https://docs.docker.com/engine/reference/commandline/builder_prune/)

docker system dfコマンドでDockerのディスク使用量が確認すると，その際にBuild Cacheも確認できるようです．
ただし，[docker system dfのドキュメント](https://docs.docker.com/engine/reference/commandline/system_df/)ではBuild Cacheには言及されていません．

```sh
$ docker system df
TYPE                TOTAL               ACTIVE              SIZE                RECLAIMABLE
Images              20                  1                   10.62GB             10.62GB (100%)
Containers          1                   1                   1.084MB             0B (0%)
Local Volumes       1                   0                   6.962kB             6.962kB (100%)
Build Cache         0                   0                   0B                  0B
```

今回はこのBuild Cacheの値の変化でdocker builder pruneコマンドの影響を確認しようとしましたが，
DockerfileからのビルドやマルチステージビルドではBuild Cacheの値が増えなかったので，
効果が確認できませんでした．

そのため，残念ですがdocker builder pruneコマンドについては一旦置いておいて，他のコマンドの調査でBuild Cacheに関して何かわかれば追記していこうと思います．

今回はbuild, prune共にあまり情報が得られませんでしたが，次回はめげずにdocker config系のコマンドを見ていこうと思います．
