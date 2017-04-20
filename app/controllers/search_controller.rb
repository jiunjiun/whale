class SearchController < ApplicationController
  expose :sharks, -> { @q.result(distinct: true).order(updated_at: :desc).paginate(:page => params[:page], :per_page => 30) }

  before_action :update_meta

  def index
  end

  private
  def update_meta
    meta_tags_option = {
      site: "\"#{params[:q][:name_cont_any]}\" 搜尋結果",
    }

    prepare_meta_tags meta_tags_option
  end
end
