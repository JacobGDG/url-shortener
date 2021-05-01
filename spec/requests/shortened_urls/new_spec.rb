# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shortened_urls', type: :request do
  describe 'GET /new' do
    it 'renders a successful response' do
      get new_shortened_url_url
      expect(response).to be_successful
    end
  end
end
