class AddUserIdToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :user_id, :string
  end
end
