# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrlsController, type: :routing do
  describe 'routing' do
    it 'routes to #redirect' do
      expect(get: '/1').to route_to('shortened_urls#redirect', id: '1')
    end

    it 'routes to #index' do
      expect(get: '/shortened_urls').to route_to('shortened_urls#index')
    end

    it 'routes to #new' do
      expect(get: '/shortened_urls/new').to route_to('shortened_urls#new')
    end

    it 'routes to #show' do
      expect(get: '/shortened_urls/1').to route_to('shortened_urls#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/shortened_urls').to route_to('shortened_urls#create')
    end
  end
end
