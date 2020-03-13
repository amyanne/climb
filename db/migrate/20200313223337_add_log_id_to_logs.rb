class AddLogIdToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :log_id, :integer
  end
end
