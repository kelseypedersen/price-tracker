class ProductsController < ApplicationController


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
    @client = HTTParty.get("http://api.shopstyle.com/api/v2/products/#{params[:id].to_i}?pid=uid5001-30368749-95")
    render json: @client
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
    p @newest_products
    render json: @newest_products
  end


  private



end

# http://api.shopstyle.com/api/v2/products/359131344?pid=YOUR_API_KEY