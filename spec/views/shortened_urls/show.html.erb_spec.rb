# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shortened_urls/show', type: :view do
  before(:each) do
    @shortened_url = assign(:shortened_url, ShortenedUrl.create!(
                                              uid: 'Uid',
                                              original_url: 'Original Url',
                                              redirect_count: 2
                                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(/Original Url/)
    expect(rendered).to match(/2/)
  end
end
