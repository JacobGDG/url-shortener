# frozen_string_literal: true

json.array! @shortened_urls, partial: 'shortened_urls/shortened_url', as: :shortened_url
