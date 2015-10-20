class AddCardPictureToCards < ActiveRecord::Migration
  def change
    add_column :cards, :card_picture, :string
  end
end
