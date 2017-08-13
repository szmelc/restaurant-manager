class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :kind
      t.float :price

      t.timestamps
    end
  end
end
