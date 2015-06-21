require 'shopsense'

class ProductsController < ApplicationController

  before_action :product_find, only: [:show, :edit, :destroy]

  def index
    @products = []
    client = Shopsense::API.new('partner_id' => 'uid5001-30368749-95')
    response = client.search("women")
    @products = JSON.parse(response)["products"]
    render json: @products
  end

  def show
    render json: {product: @product}
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(id: params[:id], shopstyle_id: params[:shopstyle_id])
    if @product.save
      render json: { product: @product }, status: :created
    else
      render json: @product.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def product_find
    @product = Product.find(params[:id])
  end

end


