#This fixes the port number which capybara uses to test
Capybara.server_port = 45610

Before('@omniauth_test') do
  OmniAuth.config.test_mode = true
  # OmniAuth.config.mock_auth[:facebook] = :stupid_nonsense
  OmniAuth.config.add_mock(:facebook, {
      'provider' => 'facebook',
      'uid' => '12345',
      'user_info' => {
          'name' => 'dpsk',
          'first_name' => 'Bin',
          'last_name' => 'Laden',
          'email' => "ravi@ravi.com"
        },
        'credentials' => {'token' => 'token'}
  })
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end


