class Shark < ApplicationRecord
  belongs_to :user

  has_many :bots

  validates_presence_of :name, :cetacea
end
