class AddUserImageToUser < ActiveRecord::Migration
  def change
  	add_column :users, :user_image, :string
  end
end
