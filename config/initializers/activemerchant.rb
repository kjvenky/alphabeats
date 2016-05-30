
if Rails.env.test? or Rails.env.cucumber? or Rails.env.development? 
  ActiveMerchant::Billing::Base.mode = :test # change to :production for live
else
  ActiveMerchant::Billing::Base.mode = :production # change to :production for live
end
  ::GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(
    login: ENV['PAYPAL_USERNAME'],
    password: ENV['PAYPAL_PASSWORD'],
    signature: ENV['PAYPAL_SIGNATURE']
  )
