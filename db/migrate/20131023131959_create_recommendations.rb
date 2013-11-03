class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.boolean :active
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
