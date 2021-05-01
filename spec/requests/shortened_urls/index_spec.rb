# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shortened_urls', type: :request do
  describe 'GET /index' do
    before { create_list(:shortened_url, 5) }

    it 'renders a successful response' do
      get shortened_urls_url
      expect(response).to be_successful
    end
  end
end
