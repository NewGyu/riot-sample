# RiotJSとWebpackのサンプル

[RiotJS](http://riotjs.com/)で簡単なページ遷移をするサンプル。

## ディレクトリ構成

```
.
├── README.md
├── dist          ... ビルドされたもの一式が入る
├── package.json
├── src
│   ├── app.tag   ... このSPA全体
│   ├── sass      ... スタイル
│   ├── static    ... トランスパイルする必要のないもの
│   └── tags      ... Riotのタグ
│       ├── pages ... ガッツリページ
│       └── parts ... 細かいパーツ
├── webpack.config.js ... RiotJSのタグなどをトランスパイルする
└── yarn.lock
```

## 使い方

依存ライブラリ一式をインストール

```
$ npm install
```

dev-serverを動かして、 http://localhost:8080/ でページを参照

```
$ npm start
```