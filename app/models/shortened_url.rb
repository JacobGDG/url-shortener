# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  after_initialize :init_uid

  validates :uid, :original_url, presence: true

  def short_url
    @short_url ||= ENV['SERVICE_URL'] + uid
  end

  private

  def init_uid
    self.uid ||= SecureRandom.base58(6)
  end
end
