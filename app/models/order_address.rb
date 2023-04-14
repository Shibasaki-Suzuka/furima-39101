class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building, :call_number 

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :call_number, numericality: { only_integer: true, message: 'は半角数値を使用してください' }
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :call_number, format: {with: /\A\d{10,11}\z/, message: '10桁以上11桁以内で入力してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, call_number: call_number, order_id: order.id)
  end
end


