# frozen_string_literal: true

require 'rails_helper'
require 'shared_contexts'

RSpec.shared_examples 'user not signed in so redirect' do
  context 'when user is not signed in' do
    it 'renders a not successful response' do
      subject

      expect(response).to_not be_successful
    end

    it 'should be redirecting to sing_in' do
      subject

      expect(response.code).to eq('302')
      expect(response).to redirect_to(user_session_path)
    end
  end
end
