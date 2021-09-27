class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :admin, default: false
      t.boolean :seller
      t.timestamps
    end
  end
end
