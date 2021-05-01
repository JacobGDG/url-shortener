# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'shortened_urls#index'

  resources :shortened_urls, only: %i[index show new create]

  get '/:id', as: :shortened_url_redirect, to: 'shortened_urls#redirect'
end
