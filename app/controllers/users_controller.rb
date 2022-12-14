class UsersController < ApplicationController
  def index
    @users = User.all
    @todos = Todo.all
  end

  def show
    @user = User.find(params[:id])
    @todo = @user.todo
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, satus: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
