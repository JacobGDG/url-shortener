class CreateShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|
      t.string :uid
      t.index :uid
      t.string :original_url
      t.integer :redirect_count, default: 0

      t.timestamps
    end
  end
end
