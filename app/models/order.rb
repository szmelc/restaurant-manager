class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :meals
  accepts_nested_attributes_for :meals, :allow_destroy => true
  # validates :order_id, presence: true
  # validates_associated :meals
end
