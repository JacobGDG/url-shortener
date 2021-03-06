# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shortened_urls', type: :request do
  describe 'GET /new' do
    subject { get new_shortened_url_url }

    include_examples 'user not signed in so redirect'

    context 'when user is signed in' do
      include_context 'api request authentication helper methods'
      include_context 'api request global before and after hooks'
      it 'renders a successful response' do
        sign_in

        subject
        expect(response).to be_successful
      end
    end
  end
end
