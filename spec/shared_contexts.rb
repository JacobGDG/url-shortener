# frozen_string_literal: true

require 'rails_helper'
require 'shared_contexts'

RSpec.shared_context 'api request global before and after hooks' do
  before(:each) do
    Warden.test_mode!
  end

  after(:each) do
    Warden.test_reset!
  end
end

RSpec.shared_context 'api request authentication helper methods' do
  let(:user) { create(:user) }

  def sign_in
    login_as(user, scope: :user)
  end

  def sign_out
    logout(:user)
  end
end
