class CreatePayouts < ActiveRecord::Migration[5.2]
  def change
    create_table :payouts do |t|
      t.references :user, foreign_key: true
      t.references :parlay, foreign_key: true

      t.timestamps
    end
  end
end
