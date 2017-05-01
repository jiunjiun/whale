class Users::SessionsController < Devise::SessionsController
  layout 'sign_in'
  before_action :update_meta, only: [:new]

  private
  def update_meta
    meta_tags_option = {
      site: I18n.t('sign_in'),
    }

    prepare_meta_tags meta_tags_option
  end
end
