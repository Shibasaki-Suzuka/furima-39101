class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :item_name,          presence: true
  validates :sentence  ,         presence: true
  # validates :category_id,        presence: true
  # validates :status_id,          presence: true
  # validates :postage_burden_id,  presence: true
  # validates :prefecture_id,      presence: true
  # validates :shipping_day_id,    presence: true
  validates :selling_price,      presence: true
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
