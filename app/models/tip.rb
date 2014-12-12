class Tip < ActiveRecord::Base
  attr_accessible :bookies, :odds, :prediction_ids, :stake, :type, :won, :user_id

  has_and_belongs_to_many :predictions
  has_many :results, through: :predictions
  belongs_to :user

  def tip_won(tip)
    if tip.predictions.each do |prediction|
      prediction.result.betWon == true
    end
    end
    tip.won == true
  end
end
