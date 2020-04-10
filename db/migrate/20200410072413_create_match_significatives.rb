class CreateMatchSignificatives < ActiveRecord::Migration[6.0]
  def change
    create_table :match_significatives do |t|
      t.references :match, :player, :significative, foreign_key: true, index: true
      t.index %i[match_id player_id significative_id], name: 'one_significative_for_player_per_match', unique: true
      t.timestamps
    end
  end
end
