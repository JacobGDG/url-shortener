# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@mail.com" }
    password { 'password' }
  end
end