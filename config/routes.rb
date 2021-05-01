# frozen_string_literal: true

Rails.application.routes.draw do
  get '/:id', as: :shortened_url_redirect, to: 'shortened_urls#redirect'
end
