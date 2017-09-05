class RemoveMealkindFromMeals < ActiveRecord::Migration[5.1]
  def change
  	if column_exists? :meals, :mealkind
	    remove_column :meals, :mealkind, :string
	  end
  end
end
