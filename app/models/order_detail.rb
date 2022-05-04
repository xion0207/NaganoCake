class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum making_status: { cannot_be_manufactured: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }
end
