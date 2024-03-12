class ChangeEventsColumns < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :start_at, :datetime
    change_column :events, :end_at, :datetime
  end
end
