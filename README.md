# download_translated_TED

## 説明

TEDビデオをダウンロードして、英語・日本語の字幕をつける

![](https://raw.githubusercontent.com/maeda1150/download_translated_TED/master/images/screen_shot.png)

※OS Xでのみ確認済

## 準備

```
$ git clone git@github.com:maeda1150/download_translated_TED.git
$ cd download_translated_TED
$ bundle install
```

### 必要なソフト

#### bash, mplayer, ruby, python


##### mplayer
```
$ which mplayer
```
入っていない時は `$ brew install mplayer` または http://mplayerx.org よりダウンロード

##### ruby
```
$ which ruby
```
入っていない時は`$ brew install ruby`

##### python
```
$ which python
```
入っていない時は`$ brew install python`

##### wget
```
$ which wget
```
入っていない時は`$ brew install wget`

## 使い方

#### TED ID を調べる
1. [TED](https://www.ted.com/)のWebSiteで確認する
![](https://raw.githubusercontent.com/maeda1150/download_translated_TED/master/images/ted.jpg)
![](https://raw.githubusercontent.com/maeda1150/download_translated_TED/master/images/get_id.jpg)

1. コマンドラインから確認する

```
$ scripts/search.rb
id. duration title
 1. 13:03  日常の音に隠された思いがけない美とは
 2. 21:47  なぜ気候変動が人権を脅かすのか
 3. 15:57  斬首動画が何百万回も再生されてしまう理由
 4. 17:03  学校を閉鎖しようとするタリバンを、私がどう阻止したか
 5. 15:16  世間で語られる貧困の嘘
 6. 18:00  恐怖が動かすアメリカの政治
…

[USAGE] 'next': show next videos, '[id]': show TED ID, 'exit': exit
4

TED ID: 2337
```

#### スクリプト実行
TED IDを指定して実行
```
bash ted [TED ID]
```

`videos`以下に保存されます。

#### おすすめの再生方法
**mplayer**で再生する
```
$ mplayer AlGore_2006-480p.mp4
```

**mplayer コマンド**

- q 終了
- f フルスクリーン
- p 一時停止
- ▶ 少し早送り
- ◀ 少し前に巻き戻し

## 参考にさせて頂いたサイト

[日本語字幕付きのTED動画をつくる](http://avaveo.blogspot.jp/2010/06/ted.html)

## Contributing

改善したいことはissueに書いてますので、プルリクエスト頂けると有難いです。  
また、他に改良して欲しいところなどありましたらissueに下さい。
