class AddColumnToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :coordinates, :string
  end
end
