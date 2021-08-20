class CreateSiteHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :site_hotels do |t|
      t.integer :site_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
