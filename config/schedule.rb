set :output, "log/clon.log"

every 1.day, at: "9:00 am" do
  runner "MotivationMailer.daily_reminder("hogehoge@example.com").deliver_now"
end