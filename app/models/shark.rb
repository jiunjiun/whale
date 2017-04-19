class Shark < ApplicationRecord
  belongs_to :user

  has_many :bots, dependent: :destroy
  has_many :photos, class_name: 'SharkPhoto', dependent: :destroy

  validates_presence_of :name, :cetacea

  mount_uploader :logo,   SharkLogoUploader
  mount_uploader :banner, SharkBannerUploader

  module Status
    PROCESSING = 1
    RELEASE    = 2
  end

  def self.cetacea_ids
    Shark.all.where(status: Status::RELEASE).pluck(:cetacea).uniq.sort
  end
end
