class DeliveryAddress < ApplicationRecord
    belongs_to :customer



  # private

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + addressee
  end

end
