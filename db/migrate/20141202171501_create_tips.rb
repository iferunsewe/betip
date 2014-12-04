class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.float :odds
      t.string :bookies
      t.boolean :won
      t.integer :prediction_id
      t.integer :user_id

      t.timestamps
    end
  end
end
