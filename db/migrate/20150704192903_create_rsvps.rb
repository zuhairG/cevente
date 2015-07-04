class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :status
      t.integer :rsvp_num

      t.timestamps null: false
    end
  end
end
