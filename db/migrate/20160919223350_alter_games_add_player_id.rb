class AlterGamesAddPlayerId < ActiveRecord::Migration
  def change
    rename_column :games, :user_id, :player_id
  end
end
