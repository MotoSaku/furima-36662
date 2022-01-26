class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :city
  belongs_to :delivery

  validates :item_name, presence: true
  validates :overview, presence: true
  validates :category_id, numericality: { other_than: 1, message: "is can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "is can't be blank" } 
  validates :city_id, numericality: { other_than: 1, message: "is can't be blank" } 
  validates :charge_id, numericality: { other_than: 1, message: "is can't be blank" }
  validates :delivery_id, numericality: { other_than: 1, message: "is can't be blank" }  
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is 300~9999999, only integer and Half size number" }
  validates :image, presence: true
end
