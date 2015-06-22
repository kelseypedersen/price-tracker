class ProductsController < ApplicationController

  before_action :product_find, only: [:show, :edit, :destroy]

  def index
    render json: @products
  end

  #renamed from search to results: showing the results from shopstyle API
  #create custom route for search 
  #specific product 
  #relates to form in html 
  
  def results
    raw_input = params[:search].to_s
    formatted_input = raw_input.gsub(" ", "+")

    @client = HTTParty.get("http://api.shopstyle.com/api/v2/products?pid=uid5001-30368749-95&fts='#{formatted_input}'&offset=0&limit=20")

    render json: @client
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

  def newest_products
    @newest_products = HTTParty.get("http://api.shopstyle.com/api/v2/products?pid=uid5001-30368749-95&fts&limit=16")

    render json: @newest_products
  end 


  private

  def product_find
    @product = Product.find(params[:id])
  end

end


