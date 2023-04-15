class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.string :employer_code
      t.string :company_name
      t.string :email
      t.string :location
      t.string :avatar
      t.string :description
      t.boolean :verified

      t.string :user_code

      t.timestamps
    end
    add_index :employers, :employer_code, unique: true
  end
end