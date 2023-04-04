# アプリケーション名
ちん とん しゃん。<br>
（三味線の音を表す言葉 × 職人さんの手仕事の音）

# アプリケーション概要
民藝品を売りたい若手職人と、丁寧な暮らしがしたい人をつなぐサービスです。

# URL
https://original-app-48cn.onrender.com

# テスト用アカウント

### Basic認証
| ID       | PASSWORD |
| -------- | -------- |
| admin    | 2222     |

### テスト用アカウント
| user     | email    | PASSWORD |
| -------- | -------- | -------- |
| 出品者   | aaa@aaa  | Password1|
| 購入者   | bbb@bbb  | Password1|

# 利用方法
URLのリンクよりHPに遷移し、Basic認証を行った上でログインして使用する。

# アプリケーションを作成した背景
・当アプリは「顧客がまだつかず売る場が欲しい若手職人」と「民藝品が気になるが高くてなかなか手が出ない人」を繋ぎ、双方の課題を解決するためのアプリです。
<br><br>
・職人になりたいと思う人は私の周りだけでも決して少なくなく、私自身一時期真剣に考えたこともありました。ではなぜ長らく後継者不足や伝統工芸品の衰退が叫ばれいるのか、それは一重に「食べていくのが難しいから」です。工業化により安価な大量生産品が浸透し、かつて日用品だった民藝品は今や特別なものという意識は多くの人の中にあると思います。顧客がつくまでが大変だという話はよく耳にします。<br><br>
・一方で近年、いいものを長く使うことや「丁寧な暮らし」を求める流れがあります。伝統ある民藝品はまさにこの気流に乗るのにぴったりですが、あまり流行りを感じません。しかし「使ってみたい」という意見はよく聞こえるもので、私はここにアプリによる課題解決の需要を感じました。<br>
<br><br>
・課題は大きく「価格」「認知」「デザイン」「方法」の４つにあると考えました<br><br>

#### 「価格」
「価格が高い」「技術不足で顧客も少ない若手職人は多少安価になってもたくさん商品を売りたいのではないか」<br>
⇒商品に価値を感じてもらう<br>
⇒生活の中の写真を使ってイメージを膨らませる、ストーリー、歴史を伝える
#### 「認知」
「民藝品自体がよくわからない」「知ってもらう場が少ない」<br>
⇒作り手と買い手の距離を近付ける<br>
⇒SNS共有機能、コメント機能、写真を多く使用する
#### 「デザイン」
「現代のインテリアに馴染まない」「ユーザーが求める商品を知りたい」<br>
⇒伝統を守りつつ、現代の需要を探る<br>
⇒生活の中の写真を使ってイメージを膨らませる、リクエスト機能、いいね機能、売上商品やいいねの分析・集計機能
#### 「方法」
「売っている場所がない」「販売にお金をかけられない」<br>
アプリを使用、シンプルな構造にして直感的に使いやすくする<br>
⇒文字を少なく、写真をメインに

<br>
上記によって双方の課題を解決し、日本の手仕事を担う若手層を応援するサービスを開発しようと考えました。<br><br>

# 洗いだした要件
https://docs.google.com/spreadsheets/d/1DRgYKKCDlRA5M5CxO1_H9EZsVseAceO9n4EZuiWwQmk/edit#gid=982722306
<br>（※目標要件含む）


# 実装した機能

#### ユーザー管理  
#### マイページ  
[![Image from Gyazo](https://i.gyazo.com/b5c76dfc9007435aa77b67b9227add7a.png)](https://gyazo.com/b5c76dfc9007435aa77b67b9227add7a)  
#### 商品出品・編集・削除  
[![Image from Gyazo](https://i.gyazo.com/1b8c042bd69533aae17175491829e12e.jpg)](https://gyazo.com/1b8c042bd69533aae17175491829e12e)
#### 商品購入  
[![Image from Gyazo](https://i.gyazo.com/ee0ab1986b00744d336c80421cac3733.jpg)](https://gyazo.com/ee0ab1986b00744d336c80421cac3733)  
(エラー解消中)


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/101a1a07167a1a9a32e19c550dc5b106.png)](https://gyazo.com/101a1a07167a1a9a32e19c550dc5b106)



# 開発環境
### バックエンド
- Ruby on Rails(6.0.0)

### フロントエンド
- JavaScript
- css

### gem
- payjp
- geocoder

### API
- Maps JavaScript API
- Geocoding API

### インフラ
- PostgreSQL
- render


# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| user_check_id         | integer | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :reviews
- has_many :messages
- has_many :bookmarks
- has_one  :my_pages


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product          | string     | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| my_page          | references | null: false, foreign_key: true |

### Association

- belongs_to        :user
- belongs_to        :my_page
- has_many          :item_tag_relations
- has_many          :tags, through: :item_tag_relations
- has_many          :reviews
- has_many          :bookmarks
- has_one           :order
- has_many_attached :images



##  tags テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| tag_name     | string     | null: false, uniqueness: true               |

### Association

- has_many :items
- has_many :item_tags, through: :item_tag_relations


##  item_tags テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| tag          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :tag



## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| my_page   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :my_page
- has_one    :address



## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postcode     | string     | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order



## my_pages テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| profile          | text       | null: false                    |
| age_id           | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| atelier          | string     |                                |
| place            | string     |                                |
| bland            | string     |                                |
| website          | string     |                                |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to        :user
- has_many          :item
- has_many          :order
- has_many          :bookmarks
- has_many          :messages
- has_many_attached :images


## reviews テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to       :user
- belongs_to       :item
- has_one_attached :images



## messages テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| message   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| my_page   | references | null: false, foreign_key: true |

### Association

- belongs_to       :user
- belongs_to       :my_page



## bookmarks テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| my_page   | references | null: false, foreign_key: true |

### Association

- belongs_to       :user
- belongs_to       :item
- belongs_to       :my_page