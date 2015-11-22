class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.date :created_date

      t.timestamps null: false
    end
  end
end
