class Consoles::UsersController < ConsoleController
  def profiles
  end

  def update_profile
    if current_user.update user_params
      redirect_to profiles_consoles_users_path, notice: t('helpers.successfully_updated')
    else
      render :profiles
    end
  end

  def update_password
    if current_user.update_with_password user_params
      bypass_sign_in(current_user)
      redirect_to profiles_consoles_users_path, notice: t('helpers.successfully_updated')
    else
      flash[:current_tab] = 'password'
      render :profiles
    end
  end

  private
  def user_params
    params
      .require(:user)
      .permit(:name, :public_email, :location, :website, :bio, :avatar, :github,
              :current_password, :password, :password_confirmation)
  end
end
