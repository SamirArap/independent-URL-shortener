class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :short_id

      t.timestamps
    end
  end
end
