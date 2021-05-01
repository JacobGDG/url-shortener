# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  describe 'Callbacks' do
    describe 'after_initialize init_uid' do
      context 'before save' do
        subject { build(:shortened_url).uid }

        it 'automatically generates a uid of length 6' do
          aggregate_failures do
            expect(subject).to be_present
            expect(subject.size).to eq(6)
          end
        end
      end

      context 'after save' do
        let(:url) { create(:shortened_url) }

        subject { url.update(original_url: 'new-url.com') }

        it 'after creation, it is not changed on update' do
          expect { subject }.to_not change(url, :uid)
        end
      end
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :uid }
    it { is_expected.to validate_presence_of :original_url }
  end
end
