class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :sentence
    validates :selling_price, numericality: { only_integer: true, message: 'は半角数値を使用してください' }
    validates :image
  end
  validates :selling_price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300~9,999,999を入力してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage_burden
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :category, numericality: { other_than: 1, message: "can't be blank" }
  validates :status, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_burden, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day, numericality: { other_than: 1, message: "can't be blank" }
end
