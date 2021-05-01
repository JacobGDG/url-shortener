class AddUserToShortenedUrl < ActiveRecord::Migration[6.1]
  def change
    add_reference :shortened_urls, :user, index: true
  end
end
