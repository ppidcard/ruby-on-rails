class CreatePropertySuburbs < ActiveRecord::Migration[6.1]
  def change
    create_table :property_suburbs do |t|
      t.integer :property_id
      t.integer :suburb_id
      t.timestamps
    end
  end
end
