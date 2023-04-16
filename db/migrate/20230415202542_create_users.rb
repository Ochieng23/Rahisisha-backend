# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_code
      t.string :username
      t.string :password_digest
      t.string :role

      t.timestamps
    end
    add_index :users, :user_code, unique: true
  end
end
