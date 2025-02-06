class SessionsController < ApplicationController
  def create
    user = session_params
    name = user[:name]
    password = user[:password]
    if name.empty? or password.empty?
      redirect_to "/signin", notice: "You need to fill your name and password."
    end

    user = User.find_by(name: params[:session][:name])

    if user
      user = User.find_by(name: params[:session][:name],
                          password: params[:session][:password])
      if user
        log_in(user)
      else
        redirect_to "/signin", notice: "Wrong password."
      end
    else
      redirect_to "/signin", notice: "We couldn't find your account."
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private
    def session_params
      params.expect(session: [ :name, :password ])
    end
end
