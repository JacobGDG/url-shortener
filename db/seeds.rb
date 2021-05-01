# frozen_string_literal: true

FactoryBot.create_list(:user, 5)

(0..9).each do |i|
  FactoryBot.create(
    :shortened_url,
    uid: "url-#{i + 1}"
  )
end
