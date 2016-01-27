class OrderItem < ActiveRecord::Base
  belongs_to :album
  belongs_to :order
end
