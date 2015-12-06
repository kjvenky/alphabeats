FactoryGirl.define do
  factory :user do
	    email "ravi@codeastra.com"
	    password "secret123"
	    first_name "Ravi"
	    last_name "Kanth"
      musician false
      
      factory :musician do
        musician true
      end
  end

end
