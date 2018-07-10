class AddCategoryToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :league, :string
  end
end
