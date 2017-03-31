class Bot < ApplicationRecord
  belongs_to :shark

  validates_presence_of :kind, :bot_id
end
