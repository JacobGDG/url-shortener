# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  describe 'Callbacks' do
    describe 'after_intialize init_uid' do
      subject { described_class.new.uid }

      it 'automatically generates a uid of length 6' do
        aggregate_failures do
          expect(subject).to be_present
          expect(subject.size).to eq(6)
        end
      end
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :uid }
    it { is_expected.to validate_presence_of :original_url }
  end
end
