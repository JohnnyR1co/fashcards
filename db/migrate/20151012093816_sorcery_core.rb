class SorceryCore < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: false
    change_column :users, :password, :string, null: false
    add_column :users, :crypted_password, :string, null: false
    add_column :users, :salt, :string, null: false
    add_index :users, :email, unique: true
  end
end
