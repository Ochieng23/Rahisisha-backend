class RemoveavatarFromEmployers < ActiveRecord::Migration[7.0]
  def change
    remove_column :employers, :avatar, :string
  end
end
