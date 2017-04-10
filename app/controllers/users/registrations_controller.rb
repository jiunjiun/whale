class Users::RegistrationsController < Devise::RegistrationsController
  layout 'sign_in'

  private
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
