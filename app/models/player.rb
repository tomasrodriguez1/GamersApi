class Player < ApplicationRecord
  belongs_to :favourite_game, class_name: 'Game', \
  foreign_key: 'favourite_game_id', optional: true
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :preference, presence: true, length: { minimum: 2 }
  validates :phone, presence: true, length: { minimum: 2 }
end
