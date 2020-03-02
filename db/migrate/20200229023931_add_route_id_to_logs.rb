class AddRouteIdToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :route_id, :string
  end
end
