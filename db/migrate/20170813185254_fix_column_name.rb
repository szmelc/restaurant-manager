class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	if column_exists? :meals, :type
	    rename_column :meals, :type, :mealkind
	  end
  end
end
