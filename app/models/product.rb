class Product < ApplicationRecord
    belongs_to :genre

    has_many :carts, dependent: :destroy
    has_many :order_details, dependent: :destroy

    has_one_attached :image

    def with_tax_price
    tax = 1.1
    (tax_excluded_price * tax).floor
    end


end
