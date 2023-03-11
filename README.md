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
| tag_name     | string     | null: false                    |
| item         | references | null: false, foreign_key: true |
| item_tag     | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :item_tags, through: :item_tag_relations


##  item_tags_relations テーブル

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