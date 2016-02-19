class StaticController < ApplicationController
  before_action :authenticate_user!, only:[:xray]
  def home
  end
  def xray

  end
end
