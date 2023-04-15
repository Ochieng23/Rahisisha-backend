class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :job_code
      t.string :job_name
      t.string :description
      t.string :employer_code
      t.string :jobtag_code

      t.timestamps
    end
    add_index :jobs, :job_code, unique: true
  end
end
