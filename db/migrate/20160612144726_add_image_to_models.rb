class AddImageToModels < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :lamps, :image, :string
  end
end
