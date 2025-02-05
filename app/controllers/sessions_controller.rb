class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name],
                        password: params[:session][:password])
    if user
      log_in(user)
    else
      redirect_to root_path, notice: "We couldn't find your account, check your name and password"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
