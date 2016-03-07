module ControllerMacros
  def login_musician
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      musician = FactoryGirl.create(:musician)
      sign_in :user, musician
    end
  end
end
