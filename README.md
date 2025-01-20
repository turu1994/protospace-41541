## テーブル設計

### usersテーブル
| カラム名            | 型       | オプション              |
|---------------------|----------|-------------------------|
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false            |
| name               | string   | null: false            |
| profile            | text     | null: false            |
| occupation         | text     | null: false            |
| position           | text     | null: false            |

#### アソシエーション
- has_many :prototypes
- has_many :comments

---

### prototypesテーブル
| カラム名      | 型          | オプション                 |
|---------------|-------------|----------------------------|
| title         | string      | null: false               |
| catch_copy    | text        | null: false               |
| concept       | text        | null: false               |
| user          | references  | null: false, foreign_key: true |

#### アソシエーション
- belongs_to :user
- has_many :comments

---

### commentsテーブル
| カラム名      | 型          | オプション                 |
|---------------|-------------|----------------------------|
| content       | text        | null: false               |
| prototype     | references  | null: false, foreign_key: true |
| user          | references  | null: false, foreign_key: true |

#### アソシエーション
- belongs_to :prototype
- belongs_to :user

---

### 備考
- 画像のアップロードにはActiveStorageを使用しています。
