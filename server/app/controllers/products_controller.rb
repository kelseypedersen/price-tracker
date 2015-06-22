class ProductsController < ApplicationController

  before_action :product_find, only: [:show, :edit, :destroy]

  def index

    # client = Shopsense::API.new('partner_id' => 'uid5001-30368749-95')
    # response = client.search(params[:search])
    # # Search needs to be a parameter that is passed in from the user.
    # raw_products = JSON.parse(response)["products"]

    # @id = []
    
    # @products = raw_products.map do |product|
    #   @id << product.values[0]
    #   # This gives us all of the id's of the products returned by the search
    # end
    render json: @products
  end

  def results
    p "*" * 100
    p params[:search]
    p "*" * 100
    raw_input = params[:search].to_s
    formatted_input = raw_input.gsub(" ", "+")
    p "*" * 100
    p formatted_input
    @client = HTTParty.get("http://api.shopstyle.com/api/v2/products?pid=uid5001-30368749-95&fts='#{formatted_input}'&offset=0&limit=20")
    # @parsed_client = JSON.parse(client)

    render json: @client
     # raw_products = JSON.parse(response)["products"]
  end

  #renamed from search to results: showing the results from shopstyle API
  #create custom route for search 
  #specific product 
  #relates to form in html 
  

  # def results
  #   client = Shopsense::API.new('partner_id' => 'uid5001-30368749-95')
  #   response = client.search(params[:search])

  #   raw_products = JSON.parse(response)["products"]

  #   @id = []
    
  #   @products = raw_products.map do |product|
  #     @id << product.values[0]
  #   end
  # #   @products = Product.search(params[:search])
  #   render json: @products
  # end

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


