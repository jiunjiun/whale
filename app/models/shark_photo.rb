class SharkPhoto < ApplicationRecord
  belongs_to :shark

  mount_uploader :image, SharkPhotoUploader

  before_create :update_position

  def as_json opts={}
    super.merge({
      size: self.image.size,
      url: self.image.try(:url),
      name: self.image.try(:file).try(:filename)
    })
  end

  private
  def update_position
    shark_id = self.shark_id
    self.position = self.shark.photos.count + 1
  end
end

