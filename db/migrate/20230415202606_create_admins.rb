# frozen_string_literal: true

class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :admin_code
      t.string :full_name
      t.string :email

      t.string :user_code

      t.timestamps
    end
    add_index :admins, :admin_code, unique: true
  end
end
