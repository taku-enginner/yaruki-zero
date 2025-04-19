class TimelinesController < ApplicationController
  def index
    @motivations = Motivation.where.not(comment: [nil, ""]).order(created_at: :desc).limit(50)
  end
end
