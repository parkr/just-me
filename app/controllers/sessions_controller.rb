class SessionsController < ApplicationController
  def new; end

  def destroy
    logout!
    redirect_to root_url
  end
end
