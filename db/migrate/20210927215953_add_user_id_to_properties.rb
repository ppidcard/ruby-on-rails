class AddUserIdToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :user_id, :int
  end
end
