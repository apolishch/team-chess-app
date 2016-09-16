class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|

      t.string :type
      t.string :color
      t.string :image
      t.integer :x_position
      t.integer :y_position
      t.boolean :is_captured
      t.integer :game_id


      t.timestamps null: false
    end
  end
end
