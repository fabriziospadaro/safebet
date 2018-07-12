class AddLeaguesToSports < ActiveRecord::Migration[5.2]
  def change
    add_column :sports, :leagues, :text
  end
end
