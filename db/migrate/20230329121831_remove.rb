class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :items, :my_pages, foreign_key: true
  end
end
