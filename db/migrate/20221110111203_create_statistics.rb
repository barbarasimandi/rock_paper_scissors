class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.integer :total_played
      t.integer :user_won
      t.integer :opponent_won

      t.timestamps
    end
  end
end
