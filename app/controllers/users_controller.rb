class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  # def show
  #   @user = User.find(params[:id])
  # end
  
  def create
    @user = Users.new(user_params)
    if @user.save
      flash[:success] = "Arckへようこそ"
      redirect_to user_url(@user)
      #登録成功のメッセージ
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

  