class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  validates :title, presence: true, length: { minimum: 3, maximum: 40 }
  validates :opinion, presence: true, length: { minimum: 8, maximum: 150 }
end