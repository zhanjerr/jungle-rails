class Review < ActiveRecord::Base
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :description, presence: true
  validates :rating, presence: true, numericality: true
end
