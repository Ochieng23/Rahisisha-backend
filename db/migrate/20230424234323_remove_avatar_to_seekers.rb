class RemoveAvatarToSeekers < ActiveRecord::Migration[7.0]
  def change
    def up
      add_column :seekers, :avatar, :string
    end
  end
end
