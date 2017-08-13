class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :meals, :type, :mealkind
  end
end
