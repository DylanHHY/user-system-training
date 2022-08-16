class SessionsController < ApplicationController
  def create
    # render html: params[:user][:email]
    user = User.login(params[:user])
    if user
      # 發號碼牌 發session => rails controller內建的東西，結構像hash
      #[:可以自己填自己喜歡的名字]
      session[:user_session] = user.id

      redirect_to "/", notice: "登入成功"      
    else
      redirect_to "/users/sign_in", notice: "登入失敗"
    end
  end
end
