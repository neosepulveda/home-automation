class LampOnOffToInteger < ActiveRecord::Migration
  def up
    change_column :lamps, :onscript, 'integer USING CAST(onscript AS integer)'
    change_column :lamps, :offscript, 'integer USING CAST(offscript AS integer)'
  end
  def down
    change_column :lamps, :onscript, :string
    change_column :lamps, :offscript, :string
  end
end
