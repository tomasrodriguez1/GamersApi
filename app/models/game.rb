class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :calification, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :description, presence: true, length: { minimum: 2 }
end
