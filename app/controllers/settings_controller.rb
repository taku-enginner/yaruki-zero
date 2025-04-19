class SettingsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def update
    if current_user.update(user_settings_params)
      redirect_to settings_path, notice: "設定を更新しました。"
    else
      flash.now[:alert] = "設定の更新に失敗しました。"
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_settings_params
    params.require(:user).permit(:tone_preference, :notification_time, :zero_pride)
  end
end
