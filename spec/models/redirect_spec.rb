require 'rails_helper'

RSpec.describe Redirect, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :shortened_url }
  end
end
