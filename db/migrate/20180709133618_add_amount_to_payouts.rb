class AddAmountToPayouts < ActiveRecord::Migration[5.2]
  def change
    add_monetize :payouts, :amount, currency: { present: false }
  end
end
