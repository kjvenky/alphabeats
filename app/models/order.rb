class Order < ActiveRecord::Base
  belongs_to :musician, class_name: User.name
  has_many :order_items

  validates_presence_of  :musician_id
  validates_numericality_of :total

end
