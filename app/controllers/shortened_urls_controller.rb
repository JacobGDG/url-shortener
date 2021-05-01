# frozen_string_literal: true

class ShortenedUrlsController < ApplicationController
  def redirect
    url = ShortenedUrl.find_by_uid(params[:id])

    redirect_to url.original_url, status: 301 and return if url.present?

    render file: "#{Rails.root}/public/404.html",
           status: 404
  end
end
