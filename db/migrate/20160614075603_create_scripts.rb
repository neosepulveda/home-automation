class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :name
      t.text :code
      t.references :lamp, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
