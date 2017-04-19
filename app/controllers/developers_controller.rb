class DevelopersController < ApplicationController
  expose :user, find: -> (id){ User.find_by(id: id) }

  def show
    redirect_to root_path and return unless user

    update_meta
  end

  private
  def update_meta
    meta_tags_option = {
      site: user.name,
      description: user.bio,
      image: user.avatar.url,
    }

    prepare_meta_tags meta_tags_option
  end
end
