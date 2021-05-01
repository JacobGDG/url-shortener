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

      it 'increments redirect_count on the related url by 1' do
        expect do
          subject
          related_url.reload
        end.to change(related_url, :redirect_count)
          .from(0).to(1)
      end

      context 'other urls present containing only different capitalisation' do
        let!(:similar_url) { create(:shortened_url) }

        it 'redirects the request tot he urls original_url' do
          expect(subject).to redirect_to related_url.original_url
        end

        it 'does not change the similar urls redirect_count' do
          expect do
            subject
            similar_url.reload
          end.to_not change(related_url, :redirect_count)
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
