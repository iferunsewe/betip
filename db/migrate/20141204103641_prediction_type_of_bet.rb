class PredictionTypeOfBet < ActiveRecord::Migration
  def change
    create_table :predictions_type_of_bets, id: false do |t|
      t.references :prediction
      t.references :type_of_bet
    end
  end
end
