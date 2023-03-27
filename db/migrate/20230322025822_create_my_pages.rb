class CreateMyPages < ActiveRecord::Migration[6.0]
  def change
    create_table :my_pages do |t|
      t.string  :name, null: false
      t.text    :profile, null: false
      t.integer :age_id, null: false
      t.integer :prefecture_id, null: false
      t.string  :atelier
      t.string  :place
      t.string  :bland
      t.string  :website
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end