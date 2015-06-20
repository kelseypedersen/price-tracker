require "spec_helper"

describe 'ProductsController' do

  describe "GET /products" do
    it "returns all the products" do
      FactoryGirl.create :product
      # FactoryGirl.create :product, shopstyle_id: "1111111"

      get :index, {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      product_shopstyle_ids = body.map { |m| m["shopstyle_id"] }

      expect(product_shopstyle_ids).to match_array(["0000000",
                                           "1111111"])
    end
  end


  # describe "GET show " do
  #   it "has a 200 status code" do
  #     get :show
  #     expect(response.status).to eq(200)
  #   end

  #   let(:product) { create(:product) }

  #   it "returns a successful 200 response" do
  #     get :product, id: product, format: :json
  #     expect(response).to be_success
  #   end

  #   it "returns data of an single product" do
  #     get :product, id: product, format: :json
  #     parsed_response = JSON.parse(response.body)
  #     expect(parsed_response['product']).to_not be_nil
  #   end

  #   it "returns an error if the student does not exist" do
  #     get :product, id: 10 , format: :json
  #     parsed_response = JSON.parse(response.body)
  #     expect(parsed_response['error']).to eq("Product does not exist")
  #     expect(response).to be_not_found
  #   end
  # end


  # describe "GET new" do
  #   it "has a 200 status code" do
  #     get :new
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "POST create" do
  #   it "has a 200 status code" do
  #     post :create
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "GET edit" do
  #   it "has a 200 status code" do
  #     get :edit
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "PUT update" do
  #   it "has a 200 status code" do
  #     put :update
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "has a 200 status code" do
  #     get :destroy
  #     expect(response.status).to eq(200)
  #   end
  # end


end