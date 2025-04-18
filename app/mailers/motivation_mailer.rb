# app/mailers/motivation_mailer.rb
class MotivationMailer < ApplicationMailer
  default from: "no-reply@yaruki-zero.com"

  def daily_reminder(email)
    @greeting = "おはようございます"
    mail(to: email, subject: "今日のやる気、ゼロで記録してみませんか？")
  end
end
