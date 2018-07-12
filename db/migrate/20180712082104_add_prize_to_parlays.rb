class AddPrizeToParlays < ActiveRecord::Migration[5.2]
  def change
    add_column :parlays, :prize, :integer, default: 0
    add_column :parlays, :withdrawn, :bool, default: false
  end
end
