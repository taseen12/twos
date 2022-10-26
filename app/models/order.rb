class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def add_order_column_to_product
    car=Product.find(product_id)
    #id = Order.find(order_id: order.id)
    # order = Order.find(params[:id])




    if car.quantity >= 0 && car.quantity - quantity >=0

      car.quantity = car.quantity- quantity

      #car.quantity= car.quantity - quantity
      car.save
    end
  end
end
