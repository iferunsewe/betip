class UserConnections < ActiveRecord::Migration
  def change
    create_table :user_connections do |t|
      t.integer :tipster_id, null: false
      t.integer :customer_id, null: false
      t.string :tipster_name
      t.string :customer_name
      t.boolean :following

      t.timestamps
    end
  end
end
