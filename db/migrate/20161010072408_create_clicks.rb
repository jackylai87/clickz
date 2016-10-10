class CreateClicks < ActiveRecord::Migration[5.0]
  def change
    create_table :clicks do |t|
      t.string :short_url
      t.integer :click_count

      t.timestamps
    end
  end
end
