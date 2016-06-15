class DasherController < ApplicationController

  def index
    @projects = Project.includes(:builds).all
  end

  def webhook

  end
end