class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :location_id
      t.text :desc
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :free_food
      t.string :status
      t.integer :event_type_id
      t.integer :num_views
      t.integer :rsvp_max
      t.attachment :image
      t.timestamps null: false
    end
  end
end
