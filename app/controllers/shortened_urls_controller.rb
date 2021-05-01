# frozen_string_literal: true

class ShortenedUrlsController < ApplicationController
  def redirect
    @url = ShortenedUrl.find_by_uid(params[:id])

    redirect_and_increment_counter and return if url.present?

    render file: "#{Rails.root}/public/404.html",
           status: 404
  end

  private

  attr_reader :url

  def redirect_and_increment_counter
    url.update(redirect_count: url.redirect_count + 1)

    redirect_to url.original_url, status: 301
  end
end
