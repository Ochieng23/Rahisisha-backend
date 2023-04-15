class CreateJobtags < ActiveRecord::Migration[7.0]
  def change
    create_table :jobtags do |t|
      t.string :jobtag_code
      t.string :group_name

      t.timestamps
    end
    add_index :jobtags, :jobtag_code, unique: true
  end
end
