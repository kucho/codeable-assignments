class Critic < ApplicationRecord
  belongs_to :game
  has_many :critics
end
