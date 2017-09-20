class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :meals, inverse_of: :order, dependent: :destroy
  accepts_nested_attributes_for :meals, :allow_destroy => true
  # validates :order_id, presence: true
  # validates_associated :meals


  def date
  	created_at.year.to_s + "-" + created_at.month.to_s + "-" + created_at.day.to_s
  end



end
