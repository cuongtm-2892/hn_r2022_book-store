class OrderDetail < ApplicationRecord
  belongs_to :book
  belongs_to :order
end
