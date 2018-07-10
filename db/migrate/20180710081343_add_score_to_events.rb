class AddScoreToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :score, :string
  end
end
