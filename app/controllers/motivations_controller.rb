require "ostruct"
class MotivationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @already_recorded = Motivation.exists?(user: current_user, recorded_on: Date.today)
    @motivation = Motivation.new unless @already_recorded
    
    latest = Motivation.find_by(user: current_user, recorded_on: Date.today)

    if latest&.value == 0 && current_user.zero_pride?
      @comment = "ゼロ、完璧な達成ですね 😎✨"
    else
      @comment = Comment.where(tone: current_user.tone_preference).order("RANDOM()").first&.body
    end
  end
  
  def create
    Motivation.find_or_create_by(user: current_user, recorded_on: Date.today) do |m|
      m.value=params[:value].to_i
      m.comment = params[:comment]
    end
    redirect_to new_motivation_path, notice: "今日のやる気を記録しました！"
  end
  
  def graph
    @comment = Comment.where(tone: current_user.tone_preference).order("RANDOM()").first&.body
    @motivations = 7.times.map { |i| OpenStruct.new(recorded_on: i.days.ago.to_date, value: 0) }.reverse
  end
end
