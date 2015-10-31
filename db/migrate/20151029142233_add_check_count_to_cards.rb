class AddCheckCountToCards < ActiveRecord::Migration
  def change
    add_column :cards, :check_count, :integer, default: 0
  end
end
