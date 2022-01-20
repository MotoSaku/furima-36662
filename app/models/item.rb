class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :status_id
  belongs_to :charge_id
  belongs_to :city_id
  belongs_to :delivery_id

  #空の投稿を保存できないようにする
  #validates :title, :text, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :city_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }  
end
