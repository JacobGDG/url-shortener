# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrlsController, type: :request do
  describe '#redirect' do
    subject { get shortened_url_redirect_path(id: given_id_param) }
    let(:given_id_param) { 'abc123' }

    context 'on success' do
      let!(:related_url) { create(:shortened_url, uid: given_id_param) }

      it 'redirects the request tot he urls original_url' do
        expect(subject).to redirect_to related_url.original_url
      end

      it 'should return 301 status' do
        subject

        expect(response.status).to eq 301
      end

      context 'other urls present containing only different capitalisation' do
        before do
          create(:shortened_url, uid: given_id_param.capitalize)
        end

        it 'redirects the request tot he urls original_url' do
          expect(subject).to redirect_to related_url.original_url
        end
      end
    end

    context 'on failure' do
      context 'shortened_url does not exist' do
        it 'should return 304 status' do
          subject

          expect(response.status).to eq 404
        end
      end
    end
  end
end
