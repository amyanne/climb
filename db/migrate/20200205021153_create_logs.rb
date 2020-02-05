class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :num_of_attempts
      t.string :content

      t.timestamps
    end
  end
end
