class Item < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :price, numericality: true
end
