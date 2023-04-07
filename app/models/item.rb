class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :item_name,          presence: true
  validates :sentence  ,         presence: true
  validates :selling_price,      presence: true, format: { with: /\A[0-9]+\z/, numericality: {in: 300..9999999},message: '半角数値を使用してください' }
  validates :item_name,          presence: true
  validates :image,              presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage_burden
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end
