# frozen_string_literal: true

class ShortenedUrlsController < ApplicationController
  before_action :authenticate_user!, except: :redirect

  # GET /:id
  def redirect
    @shortened_url = ShortenedUrl.find_by_uid(params[:id])

    redirect_and_increment_counter and return if shortened_url.present?

    render file: "#{Rails.root}/public/404.html",
           status: 404
  end

  # GET /shortened_urls or /shortened_urls.json
  def index
    @shortened_urls = ShortenedUrl.all
  end

  # GET /shortened_urls/1 or /shortened_urls/1.json
  def show
    @shortened_url = ShortenedUrl.find(params[:id])
  end

  # GET /shortened_urls/new
  def new
    @shortened_url = ShortenedUrl.new
  end

  # POST /shortened_urls or /shortened_urls.json
  def create
    initialize_shortened_url

    respond_to do |format|
      if shortened_url.save
        format.html { redirect_to shortened_url, notice: 'Shortened url was successfully created.' }
        format.json { render :show, status: :created, location: shortened_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: shortened_url.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  attr_reader :shortened_url

  # Only allow a list of trusted parameters through.
  def shortened_url_params
    params.require(:shortened_url).permit(:original_url)
  end

  def redirect_and_increment_counter
    shortened_url.update(redirect_count: shortened_url.redirect_count + 1)

    redirect_to shortened_url.original_url, status: 301
  end

  def initialize_shortened_url
    @shortened_url = ShortenedUrl.new(
      shortened_url_params.merge(user: User.first)
    )
  end
end
