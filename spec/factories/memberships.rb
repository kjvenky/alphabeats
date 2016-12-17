FactoryGirl.define do
  factory :membership do
    user_id 1
    renewal_status 1
    start_date "2016-12-17"
    next_renewal_date "2016-12-17"
    number_of_times_renewed 1
  end
end
