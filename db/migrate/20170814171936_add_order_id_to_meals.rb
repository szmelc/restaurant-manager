class AddOrderIdToMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :meals, :order_id, :string
  end
end
