class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.string :quantity, null: false
      t.integer :product_id
      t.integer :custmer_id
      t.timestamps
    end
  end
end
