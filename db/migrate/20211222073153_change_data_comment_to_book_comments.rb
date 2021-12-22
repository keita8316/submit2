class ChangeDataCommentToBookComments < ActiveRecord::Migration[5.2]
  def change
    change_column :book_comments, :comment, :text
  end
end
