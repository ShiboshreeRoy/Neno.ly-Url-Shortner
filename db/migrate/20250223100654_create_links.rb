class CreateLinks < ActiveRecord::Migration[7.2]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :short_code
      t.integer :user_id
      t.integer :clicks
      t.integer :impressions

      t.timestamps
    end
  end
end
