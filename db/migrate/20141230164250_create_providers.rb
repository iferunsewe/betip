class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :uid
      t.string :provider
      t.integer :user_id

      t.timestamps
    end
  end
end
