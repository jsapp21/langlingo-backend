class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :language
      t.integer :points, default: 0
      t.integer :time, default: 0

      t.timestamps
    end
  end
end
