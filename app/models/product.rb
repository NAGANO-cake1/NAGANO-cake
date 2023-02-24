class Product < ApplicationRecord
    belongs_to :genre

    has_many :carts, dependent: :destroy
    has_many :order_details, dependent: :destroy
    has_many :orders, through: :order_details

    has_one_attached :image

    def with_tax_price
    tax = 1.1
    (tax_excluded_price * tax).floor
    end

    # validation
     validates :name, presence: true
     validates :description, presence: true
     validates :tax_excluded_price,  presence: true
     validates :is_active, presence: true

end
