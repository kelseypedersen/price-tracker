require 'spec_helper'

describe 'WantsController' do

  describe "GET index" do
    it "has a 200 status code" do
      get :index, :user_id => 1
      expect(response.status).to eq(200)
    end
  end

  #   it "has a success status code" do
  #     get :index
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET show" do
  #   it "has a 200 status code" do
  #     get :show
  #     expect(response.status).to eq(200)
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

  # describe "DELETE destory" do
  #   it "has a 200 status code" do
  #     get :destroy
  #     expect(response.status).to eq(200)
  #   end
  # end


end