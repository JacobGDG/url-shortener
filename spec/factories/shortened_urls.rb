# frozen_string_literal: true

FactoryBot.define do
  factory :shortened_url do
    original_url { "https://www.example.com/#{SecureRandom.uuid}" }
    user { User.last || create(:user) }
  end
end
