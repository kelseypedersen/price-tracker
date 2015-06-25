class WantsController < ApplicationController
  # before_action :wants_find, only: [:index, :show, :edit, :destroy, :update]

  def index
    @wants = Want.where(user_id: params[:user_id].to_i)
    p "*" * 100
    p @wants
    render json: @wants
  end

  def show
    render json: @want
  end

  def new
    @want = Want.new
  end

  def create
    @want = Want.new(user_id: params[:user_id].to_i, product_id: params[:prodId].to_i, max_price: params[:wishPrice].to_i, prod_name: params[:prodName], url: params[:prodUrl], fulfilled: false)
    if @want.save
      p @want
      render json: @want, status: :created
    else
      render json: @want.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    render json: @want
  end

  def update
    @want = Want.update(user_id: params[:user_id], product_id: params[:id], max_price: params[:max_price], fulfilled: false)
  end

  def destroy
    @want.destroy
  end

  private

  # def wants_find
  #   @user = User.find(params[:user_id])
  #   @wants = Want.where(user_id: @user.id)
  #   @want = @wants.find(params[:id])
  # end

end