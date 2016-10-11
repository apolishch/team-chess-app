class RemoveImagesFromPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :image, :string
  end
end
