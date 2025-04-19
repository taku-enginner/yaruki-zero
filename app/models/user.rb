class User < ApplicationRecord
  has_many :motivations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         
  enum tone_preference: {
    tan: 0, # 淡々
    ironic: 1, # 皮肉寄り
    philosophy: 2 # 哲学的
  }

  enum notification_time: {
    notify_never: 0,
    notify_morning: 1, # 7時
    notify_noon: 2,    # 12時
    notify_night: 3    # 21時
  }

  # 表示用の日本語変換
  def self.tone_options_for_select
    {
      "淡々" => :tan,
      "皮肉寄り" => :ironic,
      "哲学的" => :philosophy
    }
  end

  #　表示用の日本語変換
  def self.notification_time_options
    {
      "通知しない" => :notify_never,
      "朝7時" => :notify_morning,
      "昼12時" => :notify_noon,
      "夜21時" => :notify_night
    }
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
