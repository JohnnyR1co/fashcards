class RemoveCheckCountFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :check_count, :integer
  end
end
