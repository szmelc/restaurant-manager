class AddDescriptionToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :description, :text
  end
end
