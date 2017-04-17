class CetaceasController < ApplicationController
  expose :sharks, {find: ->(id, scope) { scope.where(status: Shark::Status::RELEASE, cetacea: id) }}

  def show
    redirect_to root_path and return if KeyValues::Shark::Cetacea.where(id: params[:id].to_i).blank?
  end
end
