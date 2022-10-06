class AddColumnToFoodTable < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :integer
  end
end
