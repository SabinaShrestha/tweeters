class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    add_column :users, :handle, :string
    add_column :users, :followers, :text
    add_column :users, :following, :text
  end
end
