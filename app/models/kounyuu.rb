class Kounyuu < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :item
  # has_one :hassousaki
end
