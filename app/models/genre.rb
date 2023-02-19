class Genre < ApplicationRecord
    #t.string :name, null: false
    has_many :products, dependent: :destroy
end
