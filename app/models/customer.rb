class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # with_options presence: true do
    #   validates :last_name
    #   validates :first_name
    #   validates :last_name_kana
    #   validates :first_name_kana
    #   validates :email
    #   validates :postal_code
    #   validates :address
    #   validates :telephone_number
    # end

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
end
