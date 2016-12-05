# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderItem < ActiveRecord::Base
  belongs_to :album
  belongs_to :order
end
