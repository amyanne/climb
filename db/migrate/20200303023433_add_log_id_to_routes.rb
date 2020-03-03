class AddLogIdToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :log_id, :string
  end
end
