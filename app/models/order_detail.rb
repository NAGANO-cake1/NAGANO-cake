class OrderDetail < ApplicationRecord
  enum making_status: { cannot_start: 0, wait_for_production: 1, work_in_progress: 2, production_completed: 3}
    belongs_to :order
    belongs_to :product

    validates :quantity, presence: true
end
