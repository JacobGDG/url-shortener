# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shortened_urls', type: :request do
  describe 'GET /show' do
    let(:shortened_url) { create(:shortened_url) }

    it 'renders a successful response' do
      get shortened_url_url(shortened_url)
      expect(response).to be_successful
    end
  end
end
