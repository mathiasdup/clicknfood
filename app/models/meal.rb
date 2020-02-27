class Meal < ApplicationRecord
  include AlgoliaSearch

  has_many :orders
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: %w(french chinese mexican japanese italian indian lebanese viet) }
  validates :quantity, presence: true, inclusion: { in: 1..10 }
  validates :location, presence: true
  validates :price, presence: true


  algoliasearch do
    attributes :location, :category
  end

end
