class SessionsController < ApplicationController
  def create
    hashed_password = Digest::SHA1.hexdigest("xx-#{params[:user][:password]}yy")

    user = User.find_by(
      email: params[:user][:email],
      password: hashed_password
    )
    if user
      redirect_to "/", notice: "登入成功"      
    else
      redirect_to "/users/sign_up"
    end
  end
end
