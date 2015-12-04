require 'rails_helper'

RSpec.describe User, type: :model do

	  before(:each) do
		@attr = { :first_name => "Example", :last_name => "User",
		 :email => "user@example.com",  :password => "secret123", :confirmed_at => Time.now-2.days}
	  end

    it "should create a new instance given valid attributes" do 
        new_user = User.new(@attr)
        # new_user.save
        expect(new_user).to be_valid
    end

    it "should require a first name" do
        no_first_name_user = User.new(@attr.merge(:first_name => ""))
        expect(no_first_name_user).to_not be_valid
    end

    it "should require a last name" do
        no_last_name_user = User.new(@attr.merge(:last_name => ""))
        expect(no_last_name_user).to_not be_valid
    end

    it "should reject names that are too long" do
        long_first_name = "a" * 26
        long_first_name_user = User.new(@attr.merge(:first_name => long_first_name))
        expect(long_first_name_user).to_not be_valid
    end

    it "should reject names that are too long" do
        long_last_name = "a" * 26
        long_last_name_user = User.new(@attr.merge(:last_name => long_last_name))
        expect(long_last_name_user).to_not be_valid
    end

    it "is not a musician by default" do
        non_musican_user = User.new(@attr)
        expect(non_musican_user).to be_valid
        expect(non_musican_user.musician?).to be false
    end

end
