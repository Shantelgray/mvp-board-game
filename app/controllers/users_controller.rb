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
    # verify that user you're editing is current user
    # if not, redirect to show or index page for users
  end

  def create
    @user = user.new(sweet_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    # TODO
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
