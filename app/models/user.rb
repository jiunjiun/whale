class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sharks
  has_one  :donate, class_name: 'UserDonate'

  validates_presence_of :name

  mount_uploader :avatar,   UserAvatarUploader

  before_create :setup_info

  attr_accessor :current_password

  def release_sharks
    self.sharks.where(status: Shark::Status::RELEASE)
  end

  private
  def setup_info
    self.public_email = self.email

    # build donate
    self.build_donate
  end
end
