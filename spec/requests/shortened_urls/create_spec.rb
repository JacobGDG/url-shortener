# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shortened_urls', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          shortened_url: {
            original_url: 'https://example.com'
          }
        }
      end

      it 'creates a new ShortenedUrl' do
        expect do
          post shortened_urls_url, params: valid_params
        end.to change(ShortenedUrl, :count).by(1)
      end

      it 'redirects to the created shortened_url' do
        post shortened_urls_url, params: valid_params
        expect(response).to redirect_to(shortened_url_url(ShortenedUrl.last))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          shortened_url: {
            someting_random: true
          }
        }
      end

      it 'does not create a new ShortenedUrl' do
        expect do
          post shortened_urls_url, params: invalid_params
        end.to change(ShortenedUrl, :count).by(0)
      end

      it 'renders an unsuccessful response' do
        post shortened_urls_url, params: invalid_params
        expect(response).to_not be_successful
      end
    end
  end
end
