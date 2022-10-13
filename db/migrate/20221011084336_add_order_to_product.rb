class AddOrderToProduct < ActiveRecord::Migration[6.0]
  def change
    #add_reference :products, :Order, null: true, foreign_key: true
  end
end
