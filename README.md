#Kizuna

## サイト概要
### 人と人とを繋ぐアプリケーション


### テーマを選んだ理由
前職では、コロナの影響もあり、人との距離を取らないといけないため、社員同士も関わりが薄く、
先輩の社員に質問しようとしても、遠征に行ったり、質問するタイミングが合わないということが
しばしばありました。
その経験から、社内でコミュニケーションツールを作れば、
人と人が離れていても質問したり、コミュニケーションが取れるのでいいなと思い、
その背景からこの度ポートフォリオのテーマとして選びました。


### ターゲットユーザ
新入社員や会社員全員


### 主な利用シーン
職場内、オフの日


## 設計書
//ゲスト
  PF用なので社員側と同じ画面/動作をします。ゲストは会員側の編集ができません。<br>
  <br>*実装機能<br>
  社員側と同じ

//社員
  MY PAGE, NEWS, EVENTS, BLOGS, PRODUCTS, Q&A, LOG OUTができて、<br>
  Productから商品をカートに入れて擬似注文ができます。<br>
  <br>*実装機能<br>
  MY PAGE/社員情報の編集、注文履歴への遷移、Q＆Aへの遷移ができます。
  NEWS/管理者が投稿した内容を閲覧し、キーワード検索ができます。

//管理者
  EMPLOYEES, NEWS, EVENTS, BLOGS, PRODUCTSが閲覧できます。

## 開発環境
- OS：macOS
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
セルシス/DMMWEBCAMPの教材用画像素材使用