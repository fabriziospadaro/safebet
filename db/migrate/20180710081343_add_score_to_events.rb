class AddScoreToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :scraped_score, :string
    add_column :events, :team_a_score, :integer
    add_column :events, :team_b_score, :integer
  end
end
