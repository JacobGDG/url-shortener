# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shortened_urls', type: :request do
  describe 'GET /index' do
    subject { get shortened_urls_url }
    before { create_list(:shortened_url, 5) }

    include_examples 'user not signed in so redirect'

    context 'when user is signed in' do
      include_context 'api request authentication helper methods'
      include_context 'api request global before and after hooks'
      before(:each) { sign_in }

      it 'renders a successful response' do
        subject

        expect(response).to be_successful
      end
    end
  end
end
