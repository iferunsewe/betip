class CreateTypeOfBets < ActiveRecord::Migration
  def change
    create_table :type_of_bets do |t|
      t.string :name
      t.integer :prediction_id

      t.timestamps
    end
  end
end
