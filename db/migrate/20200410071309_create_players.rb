class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.references :team, foreign_key: true, index: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
