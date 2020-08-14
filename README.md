## ディレクトリ構成
下記の構成としています．

```
.
├── _config.yml         # jekyll の設定を記載
├── Dockerfile          # ローカル環境用のDockerfile
├── css                 # カスタマイズ用css置き場
├── _layouts            # 各ページのレイアウト定義ファイルを格納する
├── _includes           # headerやfooterなどのファイルを格納する
│   ├── contents        # メインコンテンツのhtmlを格納
│   ├── env             # head/foot など環境系のhtmlを格納
│   └── parts           # navbarやjumbotronなどの大枠デザインのhtmlを格納
├── _posts              # 各記事を格納する
├── images              # 画像ファイル置き場
├── _data               # データ置き場？現状はタグの変換テーブル置き場
├── index.markdown      # トップページ
├── news.markdown       # news一覧のページ
├── blog.markdown       # blog記事一覧のページ
└── members.markdown    # メンバー一覧のページ
```

## サーバ起動方法

### Docker Imageのビルド
このディレクトリで下記コマンドを実行
```
$ docker build -t [tag_name]:latest .
```

### コンテナの起動
下記で動く
```
$ docker run --rm -it -v ${PWD}:/root/app -p 8080:4000 [tag_name]:latest
```
[http://localhost:8080/](http://localhost:8080/)にアクセス
