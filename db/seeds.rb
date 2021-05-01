# frozen_string_literal: true

users = FactoryBot.create_list(:user, 5)

(0..9).each do |i|
  FactoryBot.create(
    :shortened_url,
    uid: "url-#{i + 1}",
    user: users.sample
  )
end
