class AddColumnToCard < ActiveRecord::Migration
  def change
    add_column :cards, :check, :integer, default: 0
    add_column :cards, :repetition_interval, :integer
    add_column :cards, :ef, :decimal, default: 2.5
    add_column :cards, :quality, :integer
  end
end
