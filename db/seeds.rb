# frozen_string_literal: true

(0..9).each do |i|
  FactoryBot.create(
    :shortened_url,
    uid: "url-#{i + 1}"
  )
end
