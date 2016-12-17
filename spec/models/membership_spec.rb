require 'rails_helper'

RSpec.describe Membership, type: :model do

  it { should belong_to(:user) }
  # it { is_expected.to have_one(:subscription_item) }
  it { should have_one(:subscription_item) }
end
