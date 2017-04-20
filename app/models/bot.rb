class Bot < ApplicationRecord
  belongs_to :shark

  validates_presence_of :kind, :bot_id
  validates_uniqueness_of :kind, scope: :shark_id

  before_create :clear_space

  module Kind
    FACEBOOK = 1
    LINE     = 2
    TELEGRAM = 3
  end

  private
  def clear_space
    self.bot_id.delete!(' ')
  end
end
