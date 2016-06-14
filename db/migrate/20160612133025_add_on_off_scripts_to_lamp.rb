class AddOnOffScriptsToLamp < ActiveRecord::Migration
  def change
    add_column :lamps, :onscript, :string
    add_column :lamps, :offscript, :string
  end
end
