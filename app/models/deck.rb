class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :name, presence: { message: "Can't be blank" }
end
