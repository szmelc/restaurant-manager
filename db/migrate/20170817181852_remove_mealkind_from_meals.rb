class RemoveMealkindFromMeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :meals, :mealkind, :string
  end
end
