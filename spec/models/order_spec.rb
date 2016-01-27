require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:musician_id)}
  it { should belong_to(:musician).class_name('User') }
  it { should validate_numericality_of(:total) }

  it { should have_many(:order_items) }
end
