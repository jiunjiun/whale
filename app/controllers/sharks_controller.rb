class SharksController < ApplicationController
  expose :sharks, -> { Shark.where(status: Shark::Status::RELEASE) }
  expose :shark, find: -> (id){ sharks.find_by(id: id) }

  def index
  end

  def show
    redirect_to root_path and return unless shark

    update_meta
  end

  private
  def update_meta
    meta_tags_option = {
      site: shark.name,
      description: shark.desc,
      keywords: KeyValues::Shark::Cetacea.find(shark.cetacea).name,
      image: shark.banner
    }

    prepare_meta_tags meta_tags_option
  end
end
