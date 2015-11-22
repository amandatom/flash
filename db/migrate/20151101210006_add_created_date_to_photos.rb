class AddCreatedDateToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :created_date, :date
  end
end
