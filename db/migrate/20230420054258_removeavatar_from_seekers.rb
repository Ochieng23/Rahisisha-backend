class RemoveavatarFromSeekers < ActiveRecord::Migration[7.0]
  def change
    remove_column :seekers, :avatar, :string
  end
end
