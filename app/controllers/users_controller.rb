class UsersController < ApplicationController
  def create
    user = user_params
    name = user[:name]
    password = user[:password]
    respond_to do |format|
      if name.empty? or password.empty?
        format.html { redirect_to "/signup", notice: "You need to fill your name and password" }
      end

      user_found = User.find_by(name: name)
      if user_found
        format.html { redirect_to "/signup", notice: "User already exists" }
      else
        @user = User.new(user)
        if @user.save
          format.html { redirect_to "/signup", notice: "Account created successfully" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    def user_params
      params.expect(user: [ :name, :password ])
    end
end
