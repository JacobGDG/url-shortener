# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shortened_urls/new', type: :view do
  before(:each) do
    assign(:shortened_url, create(:shortened_url,
                                  uid: 'MyString',
                                  original_url: 'http://google.com'))
  end

  xit 'renders new shortened_url form' do
    render

    assert_select 'form[action=?][method=?]', shortened_urls_path, 'post' do
      assert_select 'input[name=?]', 'shortened_url[original_url]'
    end
  end
end
