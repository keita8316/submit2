class DropPost < ActiveRecord::Migration[5.2]
  def change
    drop_table :book_comments
    drop_table :favorites
  end
end
