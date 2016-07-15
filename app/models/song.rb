# == Schema Information
#
# Table name: songs
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  song_title          :string
#  lyrics              :text
#  terms               :boolean
#  audio_file          :string
#  duration            :time
#  note_to_admin       :text
#  album_id            :integer
#  user_id             :integer
#  explicit_lyrics     :boolean
#  self_written        :boolean
#  original_artist     :string
#  original_song_title :string
#  spotify             :string
#  itunes              :string
#  apple_music         :string
#  google_play         :string
#  amazon              :string
#  r_dio               :string
#  deezer              :string
#  tidal               :string
#  youtube             :string
#  microsoft_groove    :string
#  media_net           :string
#  producer            :string
#  producer_email      :string
#  view_count          :integer
#  download_count      :integer
#  income_till_date    :decimal(7, 2)
#

class Song < ActiveRecord::Base


  belongs_to :musician, class_name: User.name, foreign_key: 'user_id'
  belongs_to :album
  has_many :song_stats


  validates_presence_of :song_title,  :terms, :audio_file, :album_id, :user_id 
 # validates_presence_of :song_title,  :terms, :audio_file, :album_id, :user_id,  :original_artist, :original_song_title

  validates :terms, acceptance: {accept: true}
  validates_inclusion_of :explicit_lyrics, :in => [true, false]
  validates_inclusion_of :self_written, :in => [true, false]
  validates :producer_email, :allow_blank => true, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})|^$\z/i, :message => "must be in a valid email format"}
  validates :income_till_date, :allow_blank => true, numericality: true
  validates :view_count, :allow_blank => true, numericality: { :only_integer => true }
  validates :download_count, :allow_blank => true, numericality: { :only_integer => true} 

  #trading module
  has_many :shareholders
  has_many :shareholder_users, through: :shareholders, class_name: 'User'

  has_many :bids
  has_many :bid_users, through: :bids, class_name: 'User'

  has_many :offers
  has_many :offer_users, through: :offers, class_name: 'User'

  has_many :trade_logs

  mount_uploader :audio_file, AudioFileUploader

  # extend ConvertCsv
  #
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |song_stat_row|
        csv << song_stat_row.attributes.values_at(*column_names)
      end
    end
  end

end
