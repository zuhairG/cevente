class DropUserEvents < ActiveRecord::Migration
  def change
    drop_table :user_events
  end
end
