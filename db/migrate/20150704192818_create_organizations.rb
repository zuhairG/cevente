class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :desc
      t.string :web_add
      t.string :address1
      t.string :address2
      t.string :email
      t.string :type
      t.boolean :is_uni

      t.timestamps null: false
    end
  end
end
