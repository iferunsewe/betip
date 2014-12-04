class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :goalsHomeTeam
      t.integer :goalsAwayTeam
      t.boolean :betWon

      t.timestamps
    end
  end
end
