class Users::RegistrationsController < Devise::RegistrationsController
  layout 'sign_in'
  before_action :update_meta, only: [:new]

  private
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_meta
    meta_tags_option = {
      site: I18n.t('sign_up'),
    }

    prepare_meta_tags meta_tags_option
  end
end
