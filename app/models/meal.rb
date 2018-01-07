class Meal < ApplicationRecord
  belongs_to :orders, optional: true
end
