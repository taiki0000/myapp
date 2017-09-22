class HomeController < ApplicationController
  before_action :forbit_login_user, {only:[:top]}
  def top
  end

  def about
  end
end
