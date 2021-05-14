class CreateRedirects < ActiveRecord::Migration[6.1]
  def change
    create_table :redirects do |t|
      t.references :shortened_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
