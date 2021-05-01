# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shortened_urls, only: %i[index show new create]
  get '/:id', as: :shortened_url_redirect, to: 'shortened_urls#redirect'
end
