class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.strong :grade
      t.string :location

      t.timestamps
    end
  end
end
