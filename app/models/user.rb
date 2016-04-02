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

class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :username, :allow_blank => true, format: {with: /\A[a-z0-9_]+\z/, message: "must be lowercase alphanumerics only"}, length: { maximum: 32, message: "exceeds maximum of 32 characters"}, exclusion: { in: ['www', 'mail', 'ftp'], message: "is not available"}, uniqueness: true

  has_many :albums# , foreign_key: 'musician_id'
  has_many :songs# , foreign_key: 'musician_id'
  has_many :orders# , foreign_key: 'musician_id'
  has_one :wallet
  has_many :transaction_logs


	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.first_name=auth.info.first_name
	    user.last_name=auth.info.last_name
	  end
	end

  def musician?
    self.musician 
  end

  def admin?
    self.admin 
  end
  
end
