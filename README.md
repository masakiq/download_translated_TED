# download_translated_TED

## 説明

TEDビデオをダウンロードして、英語・日本語の字幕をつける

![](https://raw.githubusercontent.com/maeda1150/download_translated_TED/master/images/screen_shot.png)

※mac環境でのみ確認済。windowsの人はごめんなさい。

## 準備

```
git clone git@github.com:maeda1150/download_translated_TED.git
```


### 必要なソフト

#### bash, mplayer, ruby, nokogiri(ruby-gem), python


##### mplayer
```
which mplayer
```
入っていない時は `brew install mplayer` または http://mplayerx.org よりダウンロード

##### ruby
```
which ruby
```
入っていない時は
```
brew install ruby
```

##### nokogiri
```
gem list nokogiri
```
入っていない時は
```
gem install nokogiri
```

##### python
```
which python
```
入っていない時は
```
brew install python
```

## 使い方

#### video ID を確認する

![](https://raw.githubusercontent.com/maeda1150/download_translated_TED/master/images/ted.jpg)

![](https://raw.githubusercontent.com/maeda1150/download_translated_TED/master/images/get_id.jpg)


#### スクリプト実行
ダウンロードしたいvideo IDを指定する
```
bash ted [video ID]
```

`videos`以下に保存されます。

#### おすすめの再生方法
**mplayer**で再生する
```
mplayer AlGore_2006-480p.mp4
```

**mplayer コマンド**

- q 終了
- f フルスクリーン
- p 一時停止
- ▶ ジャンプ
- ◀ 前にジャンプ

## 参考にさせて頂いたサイト

[日本語字幕付きのTED動画をつくる](http://avaveo.blogspot.jp/2010/06/ted.html)
