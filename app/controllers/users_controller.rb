class UsersController < ApplicationController
  def create
    puts user_params
  end

  private
    def user_params
      params.expect(user: [ :name, :password ])
    end
end
