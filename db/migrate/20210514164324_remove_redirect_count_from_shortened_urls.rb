class RemoveRedirectCountFromShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    remove_column :shortened_urls, :redirect_count, :integer, default: 0
  end
end
