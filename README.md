## ディレクトリ構成
下記の構成としています．

```
.
├── _config.yml  # jekyll の設定を記載
├── docker-compose.yml  # ローカル環境用のdocker-composeファイル
├── css          # カスタマイズ用css置き場
├── _layouts     # 各ページのレイアウト定義ファイルを格納する
├── _includes    # headerやfooterなどのファイルを格納する
├── _posts       # 各記事を格納する
├── images       # 画像ファイル置き場
├── _data        # データ置き場？現状はタグの変換テーブル置き場
├── index.markdown    # トップページ
├── news.markdown     # news一覧のページ
├── blog.markdown     # blog記事一覧のページ
└── members.markdown  # メンバー一覧のページ
```

## サーバ起動方法
このディレクトリで下記コマンドを実行
```
$ docker-compose up
```
