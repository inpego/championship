class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :team_one, :team_two, foreign_key: { to_table: :teams }, index: true
      t.string :result, null: false
      t.timestamps
    end
  end
end
