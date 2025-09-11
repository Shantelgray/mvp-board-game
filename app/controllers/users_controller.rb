class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    redirect_to users_path, alert: "Not authorized" unless @user == current_user
  end

  def create
    @user = user.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path, alert: "Not authorized"
    elsif @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.expect(user: %i[name email password])
  end
end
