# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shortened_urls/index', type: :view do
  before(:each) do
    assign(:shortened_urls, [
             ShortenedUrl.create!(
               uid: 'Uid',
               original_url: 'Original Url',
               redirect_count: 2
             ),
             ShortenedUrl.create!(
               uid: 'Uid',
               original_url: 'Original Url',
               redirect_count: 2
             )
           ])
  end

  it 'renders a list of shortened_urls' do
    render
    assert_select 'tr>td', text: 'Uid'.to_s, count: 2
    assert_select 'tr>td', text: 'Original Url'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
