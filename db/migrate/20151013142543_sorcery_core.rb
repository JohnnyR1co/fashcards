class SorceryCore < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: false
    remove_column :users, :password, :string
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
    add_index :users, :email, unique: true
  end
end
