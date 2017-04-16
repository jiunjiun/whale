class DevelopersController < ApplicationController
  expose :user, find: -> (id){ User.find_by(id: id) }

  def show
    redirect_to root_path and return unless user
  end
end
