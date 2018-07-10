class AddIdentifierToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :unique_event_id, :string
  end
end
