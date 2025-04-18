require "ostruct"
class MotivationsController < ApplicationController
  def new
    @already_recorded = Motivation.exists?(recorded_on: Date.today)
    @motivation = Motivation.new unless @already_recorded
    @comment = Comment.order("RANDOM()").first
    @motivations = 7.times.map { |i| OpenStruct.new(recorded_on: i.days.ago.to_date, value: 0) }.reverse
  end

  def create
    Motivation.find_or_create_by(recorded_on: Date.today) do |m|
      m.value=params[:value].to_i
    end
    redirect_to new_motivation_path, notice: "今日のやる気を記録しました！"
  end
end
