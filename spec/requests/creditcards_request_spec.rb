require 'rails_helper'

RSpec.describe "Creditcards", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/creditcards/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/creditcards/show"
      expect(response).to have_http_status(:success)
    end
  end

end
