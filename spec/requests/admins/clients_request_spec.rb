# frozen_string_literal: true
RSpec.describe "Admins::Clients", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/admins/clients/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/admins/clients/index'
      expect(response).to have_http_status(:success)
    end
  end
end
