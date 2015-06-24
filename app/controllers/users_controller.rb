class UsersController < ApplicationController

  before_action :user_find, only: [:show, :edit, :destroy, :update]

  def new
    @user = User.new
  end

  def show
    render json: {user: @user}
  end

  def create
    # email and password for user no longer needed
    p "*" * 100
    p "in create"
    p params
    @user = User.find_by(facebook_id: params[:user][:oauth_id])
    p @user
    if @user
        p "*" * 100
        p "if @user"
        p @user
        render json: { user: @user }
    else
      p "*" * 100
      p "else @user"
      p @user
      @user = User.new(name: params[:user][:oauth_name], facebook_id: params[:user][:oauth_id])
      if @user.save
        p "*" * 100
        p "save @user"
        p @user
        render json: { user: @user }
      else
        p "*" * 100
        p "else @user fail"
        p @user
        # render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end
  end

  def edit
    render json: {user: @user}
  end

  def destroy
    @user.destroy
  end

  def update
    @user.update(name: params[:name], password: params[:password], email: params[:email])
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

end
