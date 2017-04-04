class Bot < ApplicationRecord
  belongs_to :shark

  validates_presence_of :kind, :bot_id
  validates_uniqueness_of :kind, scope: :shark_id

  module Kind
    FACEBOOK = 1
    LINE     = 2
    TELEGRAM = 3
  end
end
