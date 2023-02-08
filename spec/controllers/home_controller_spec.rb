# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController do
  before(:each) do
    sign_in create(:user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
