# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shortened_urls', type: :request do
  describe 'GET /show' do
    subject { get shortened_url_url(shortened_url) }
    let(:shortened_url) { create(:shortened_url, user: create(:user)) }

    include_examples 'user not signed in so redirect'

    context 'when user is signed in' do
      include_context 'api request authentication helper methods'
      include_context 'api request global before and after hooks'
      before do
        sign_in
      end

      context 'the shortened_url exists' do
        context 'and belongs to the current_user' do
          let(:shortened_url) { create(:shortened_url, user: user) }

          it 'renders a successful response' do
            subject
            expect(response).to be_successful
          end
        end

        context 'but does not belong to the current_user' do
          it 'should return unsuccessful 404 status' do
            subject

            expect(response).to_not be_successful
            expect(response.status).to eq 404
          end
        end
      end

      context 'the shortened_url does not exist' do
        subject { get shortened_url_url(id: 'does-not-exist') }

        it 'should return unsuccessful 404 status' do
          subject

          expect(response).to_not be_successful
          expect(response.status).to eq 404
        end
      end
    end
  end
end
