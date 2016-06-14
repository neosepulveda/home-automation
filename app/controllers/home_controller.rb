class HomeController < ApplicationController

  before_action :set_user, only: :index

  def index
    @lamps = Lamp.all
  end

  def front
  end

  private

  def set_user
    @user = current_user
  end

end

