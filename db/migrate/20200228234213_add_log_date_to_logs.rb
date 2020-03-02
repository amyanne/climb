class AddLogDateToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :log_date, :string
  end
end
