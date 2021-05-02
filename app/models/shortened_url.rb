# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  after_initialize :init_uid

  belongs_to :user

  validates :uid, :original_url, presence: true
  validates :original_url,
            format: {
              with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
              message: 'The protocol must be provided (http, https)'
            }

  def short_url
    @short_url ||= ENV['SERVICE_URL'] + uid
  end

  private

  def init_uid
    self.uid ||= SecureRandom.base58(6)
  end
end
