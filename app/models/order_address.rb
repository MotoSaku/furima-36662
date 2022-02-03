class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :city_id, :municipalities, :address, :building, :tel, :price, :item_id, :user_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_id, numericality: { other_than: 1, message: "is can't be blank" } 
    validates :municipalities
    validates :address
    validates :tel, format: {with: /\A[0-9]{10,11}/, message: "is invalid." }
    validates :token
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, city_id: city_id, municipalities: municipalities, address: address, building: building, tel: tel, order_id: order.id)
  end
end