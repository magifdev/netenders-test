class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(todo_params)
    @user = User.find(params[:user_id])
  end

  def new
    @todo = Todo.new
    @user = User.find(params[:user_id])
  end

  def create
    @todo = Todo.new(todo_params)
    @user = User.find(params[:user_id])
    @todo.user = @user
    if @todo.save
      redirect_to user_path(@user, @todo)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @todo = Todo.find(params[:id])
    @todo.user = @user
  end

  def update
    @todo = Todo.find(params[:id])
    @user = User.find(params[:user_id])
    @todo.user = @user
    @todo.update(todo_params)
    redirect_to user_path(@user)
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to user, satus: :see_other
  end

  private

  def todo_params
    params.require(:todo).permit(:task_name, :status, :user_id)
  end
end
