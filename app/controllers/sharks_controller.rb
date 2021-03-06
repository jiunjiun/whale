class SharksController < ApplicationController
  expose :shark, find: -> (id){ Shark.includes(:photos).where(status: Shark::Status::RELEASE).find_by(id: id) }

  def show
    redirect_to root_path and return unless shark

    update_meta
  end

  def donate
    redirect_to shark_path("#{shark.id}-#{shark.name}") and return unless shark.user.donate.html.present?

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
