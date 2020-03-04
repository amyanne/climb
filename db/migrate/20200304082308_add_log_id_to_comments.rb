class AddLogIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :log_id, :integer
    add_foreign_key :comments, :logs
  end
end
