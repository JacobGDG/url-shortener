# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shortened_urls/new', type: :view do
  before(:each) do
    assign(:shortened_url, ShortenedUrl.new(
                             uid: 'MyString',
                             original_url: 'MyString',
                             redirect_count: 1
                           ))
  end

  it 'renders new shortened_url form' do
    render

    assert_select 'form[action=?][method=?]', shortened_urls_path, 'post' do
      assert_select 'input[name=?]', 'shortened_url[uid]'

      assert_select 'input[name=?]', 'shortened_url[original_url]'

      assert_select 'input[name=?]', 'shortened_url[redirect_count]'
    end
  end
end
