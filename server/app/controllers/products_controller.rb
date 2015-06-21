require 'shopsense'

class ProductsController < ApplicationController

  before_action :product_find, only: [:show, :edit, :destroy]

  def index

    client = Shopsense::API.new('partner_id' => 'uid5001-30368749-95')
    response = client.search("women")
    raw_products = JSON.parse(response)["products"]
    @id = []
    @products = raw_products.map do |product|
      @id << product.values[0]
      # This gives us all of the id's of the products returned by the search
    end
    render json: @id
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


