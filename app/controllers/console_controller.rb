class ConsoleController < ApplicationController
  before_action :authenticate_user!

  layout 'console'

  before_action :update_meta

  private
  def update_meta
    meta_tags_option = {
      site: I18n.t('developer_backend'),
    }

    prepare_meta_tags meta_tags_option
  end
end
