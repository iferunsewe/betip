class PredictionsTips < ActiveRecord::Migration
  def change
    create_table :predictions_tips, id: false do |t|
      t.references :prediction
      t.references :tip
    end
  end
end
