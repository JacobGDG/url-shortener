# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shortened_urls/show', type: :view do
  before(:each) do
    @shortened_url = assign(:shortened_url, shortened_url)
  end
  let(:shortened_url) do
    ShortenedUrl.create!(
      uid: 'Uid', original_url: 'https://www.example.com', redirect_count: 2
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{shortened_url.short_url}/)
    expect(rendered).to match(/#{shortened_url.original_url}/)
    expect(rendered).to match(/#{shortened_url.redirect_count}/)
  end
end
