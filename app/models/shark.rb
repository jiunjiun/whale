class Shark < ApplicationRecord
  belongs_to :user

  has_many :bots, dependent: :destroy
  has_many :photos, class_name: 'SharkPhoto', dependent: :destroy

  validates_presence_of :name, :cetacea

  mount_uploader :logo,   SharkLogoUploader
  mount_uploader :banner, SharkBannerUploader
end
