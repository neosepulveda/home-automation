class CreateLamps < ActiveRecord::Migration
  def change
    create_table :lamps do |t|
      t.string :name
      t.text :description
      t.string :calendar, array: true, default: []
      t.integer :status

      t.timestamps null: false
    end
    
    add_index :lamps, :calendar, using: 'gin'
  end
end
