class Lamp < ActiveRecord::Base

  mount_uploader :image, ImageUploader

end
