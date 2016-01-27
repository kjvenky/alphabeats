FactoryGirl.define do
  factory :order do
    musician nil
    total "9.99"
    payment_status false
    shazam false
    youtube false
    store_maximizer false
  end

end
