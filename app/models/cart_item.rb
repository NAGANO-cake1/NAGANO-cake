class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    
    def subtotal
    item.with_tax_price * quantity
    end
    
end
