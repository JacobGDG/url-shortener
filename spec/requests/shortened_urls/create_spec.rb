# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shortened_urls', type: :request do
  describe 'POST /create' do
    subject { post shortened_urls_url, params: params }
    let(:params) do
      {
        shortened_url: {
          original_url: 'https://example.com'
        }
      }
    end

    context 'with valid parameters' do
      let(:shortened_url_created) { ShortenedUrl.last }

      it 'creates a new ShortenedUrl' do
        expect { subject }.to change(ShortenedUrl, :count).by(1)
      end

      it 'redirects to the created shortened_url' do
        subject

        expect(response).to redirect_to(
          shortened_url_url(shortened_url_created)
        )
      end

      it 'sets the expected shortened_url attributes' do
        subject

        expect(shortened_url_created.original_url).to eq 'https://example.com'
        expect(shortened_url_created.redirect_count).to eq 0
      end

      context 'with uid and redirect_count given' do
        let(:params) do
          {
            shortened_url: {
              original_url: 'https://example.com',
              uid: 'uid-given',
              redirect_count: '77'
            }
          }
        end

        it 'does not use the uid or redirect_count given' do
          subject

          expect(shortened_url_created.redirect_count).to eq 0
          expect(shortened_url_created.uid).to_not eq 77
        end
      end
    end

    context 'with invalid parameters' do
      let(:params) do
        {
          shortened_url: {
            someting_random: true
          }
        }
      end

      it 'does not create a new ShortenedUrl' do
        expect { subject }.to change(ShortenedUrl, :count).by(0)
      end

      it 'renders an unsuccessful response' do
        subject

        expect(response).to_not be_successful
      end
    end
  end
end
