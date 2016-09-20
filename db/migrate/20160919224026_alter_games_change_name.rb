class AlterGamesChangeName < ActiveRecord::Migration
  def change
    rename_column :games, :name, :game_title
  end
end
