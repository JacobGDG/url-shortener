# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shortened_urls/index', type: :view do
  before(:each) do
    assign(:shortened_urls, [shortened_url1, shortened_url2])
  end
  let(:shortened_url1) { create(:shortened_url) }
  let(:shortened_url2) { create(:shortened_url) }

  it 'renders a list of shortened_urls' do
    render
    assert_select 'a[href=?]', shortened_url1.short_url, count: 1
    assert_select 'a[href=?]', shortened_url2.short_url, count: 1
    assert_select 'a[href=?]', shortened_url1.original_url, count: 1
    assert_select 'a[href=?]', shortened_url2.original_url, count: 1
  end
end
