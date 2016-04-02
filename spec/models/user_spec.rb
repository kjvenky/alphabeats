# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string
#  last_name              :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  provider               :string
#  uid                    :string
#  musician               :boolean          default(TRUE)
#  admin                  :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe User, type: :model do

	  before(:each) do
		@attr = { :first_name => "Example", :last_name => "User",
		 :email => "user@example.com",  :password => "secret123", :confirmed_at => Time.now-2.days}
	  end

    it { should have_many(:albums) }
    it { should have_many(:songs) }
    it { should have_many(:orders) }
    it { should have_one(:wallet) }
    it { should have_many(:transaction_logs) }
    it { should validate_length_of(:username).is_at_most(32).with_message("exceeds maximum of 32 characters") }
    it { should validate_uniqueness_of(:username) }
    it { should validate_exclusion_of(:username).in_array(['www', 'mail', 'ftp']).with_message('is not available') }
              
                    
      
    it "should create a new instance given valid attributes" do 
        new_user = User.new(@attr)
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
        non_musican_user = User.new(@attr.merge(:musician => false))
        expect(non_musican_user).to be_valid
        expect(non_musican_user.musician?).to be false
    end

end
