class AddMyPageIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :my_page, foreign_key: true
  end
end
