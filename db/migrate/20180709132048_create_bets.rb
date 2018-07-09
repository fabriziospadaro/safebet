class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.references :event, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
