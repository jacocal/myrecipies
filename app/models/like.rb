class Like < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  validates_uniqueness_of :chef, scope: :recipe   #1 like for each recipe
end