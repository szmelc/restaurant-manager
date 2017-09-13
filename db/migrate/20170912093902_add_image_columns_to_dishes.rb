class AddImageColumnsToDishes < ActiveRecord::Migration[5.1]
  def up
    add_attachment :dishes, :image
  end

  def down
    remove_attachment :dishes, :image
  end
end
