# frozen_string_literal: true

json.extract! shortened_url, :id, :uid, :original_url, :redirect_count, :created_at, :updated_at
json.url shortened_url_url(shortened_url, format: :json)
