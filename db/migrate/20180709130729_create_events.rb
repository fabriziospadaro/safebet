class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :odds
      t.integer :team_a_id
      t.integer :team_b_id
      t.integer :winner_id
      t.references :event_date, foreign_key: true

      t.timestamps
    end
  end
end
