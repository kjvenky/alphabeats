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
#  username               :string
#  profile_photo          :string
#  stage_name             :string
#  hometown               :string
#  country                :string
#  facebook               :string
#  soundcloud             :string
#  youtube                :string
#

class User < ActiveRecord::Base

  # don't use after_create, see https://github.com/plataformatec/devise/issues/2615
  after_commit :create_wallet, on: :create

  # after_create: create_wallet

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

  #trading module
  has_many :shareholders
  has_many :shareholder_songs, through: :shareholders,  source: :song 

  has_many :bids
  has_many :bid_songs, through: :bids, source: :song

  has_many :offers
  has_many :offer_songs, through: :offers, source: :song

  has_many :purchases, :class_name => 'TradeLog', :foreign_key => 'buyer_id'
  has_many :sales, :class_name => 'TradeLog', :foreign_key => 'seller_id'

  #shortlist module
  has_many :shortlists
  has_many :shortlist_songs, through: :shortlists,  source: :song 


  mount_uploader :profile_photo, ProfilePhotoUploader

  def name
    first_name+" "+last_name
  end


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

  def create_wallet
    Wallet.create(user_id: self.id, amount: 0)
  end

end
