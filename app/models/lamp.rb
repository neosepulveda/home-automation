class Lamp < ActiveRecord::Base

  has_many :scripts, dependent: :destroy

  accepts_nested_attributes_for :scripts,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true

  validates :name,
            presence: true

  mount_uploader :image, ImageUploader

end
