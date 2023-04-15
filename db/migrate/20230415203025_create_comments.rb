class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_code
      t.string :content
      t.string :post_code
      t.string :user_code

      t.timestamps
    end
    add_index :comments, :comment_code, unique: true
  end
end
