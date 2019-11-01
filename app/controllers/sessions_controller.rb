class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
    log_in @user
    params[:remember_me] == '1' ? remember(@user) : forget(@user)
    redirect_to("/posts/index")
    else
      flash[:notice] = 'ユーザー名またはパスワードが違います'
      render ("sessions/new")
    end
  end

  def destroy
   log_out if logged_in?
   flash[:notice]='ログアウトしました'
    redirect_to('/')
  end

end

