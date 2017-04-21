class CetaceasController < ApplicationController
  expose :sharks, {find: ->(id, scope) { scope.where(status: Shark::Status::RELEASE, cetacea: id).order(updated_at: :desc) }}

  def show
    redirect_to root_path and return if KeyValues::Shark::Cetacea.where(id: params[:id].to_i).blank?

    update_meta
  end

  private
  def update_meta
    meta_tags_option = {
      site: KeyValues::Shark::Cetacea.find(params[:id].to_i).name,
    }

    prepare_meta_tags meta_tags_option
  end
end
