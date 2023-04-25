class AddAvatarToSeekers < ActiveRecord::Migration[6.1]
 

  def down
    remove_column :seekers, :avatar
  end
end
