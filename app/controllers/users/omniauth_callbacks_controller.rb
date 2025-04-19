# app/controllers/users/omniauth_callbacks_controller.rb

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])
  
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: "Google")
      else
        session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
        redirect_to root_path, alert: "Googleアカウントでのログインに失敗しました。"
      end
    end
  end
end
