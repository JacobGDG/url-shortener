# frozen_string_literal: true

class Redirect < ApplicationRecord
  belongs_to :shortened_url
end
