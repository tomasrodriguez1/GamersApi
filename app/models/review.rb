class Review < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :calification, presence: true, \
      numericality: { greater_than_or_equal_to: 1, \
          less_than_or_equal_to: 10 }
end
