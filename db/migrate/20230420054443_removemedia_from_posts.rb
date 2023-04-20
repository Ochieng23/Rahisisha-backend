class RemovemediaFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :media, :string
  end
end
