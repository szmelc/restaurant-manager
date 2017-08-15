class MealsOrder < ApplicationRecord
  belongs_to :order
  belongs_to :meal
end
