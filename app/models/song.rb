# == Schema Information
#
# Table name: songs
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  song_title      :string
#  song_writer     :string
#  album           :string
#  stage_band_name :string
#  record_label    :string
#  language        :integer
#  primary_genre   :integer
#  secondary_genre :integer
#  lyrics          :text
#  terms           :boolean
#  release_date    :date
#  audio_file      :string
#  album_cover     :string
#  duration        :time
#

class Song < ActiveRecord::Base
  validates :song_title, presence: true
  validates :song_writer, presence: true
  validates :album, presence: true
  validates :stage_band_name, presence: true
  # validates :record_label, absence: true
  validates :language, presence: true
  validates :primary_genre, presence: true
  validates :secondary_genre, presence: true
  # validates :lyrics, absence: true
  validates :terms, presence: true
  # validates :release_date, absence: true
  mount_uploader :audio_file, AudioFileUploader
  validates :audio_file, presence: true
  mount_uploader :album_cover, AlbumCoverUploader
  validates :album_cover, presence: true
  # validates :duration, absence: true

  module Language
    ENGLISH = {code: 1, text: "English"}
    ARABIC  = {code: 2, text: "Arabic"}
    CATALAN  = {code: 3, text: "Arabic"}
    CANTONESE  = {code: 4, text: "Cantonese"}
    CHINESE_SIM  = {code: 5, text: "Chinese(Simplified)"}
    CHINESE_TRAD  = {code: 6, text: "Chinese(Simplified)"}
    CROATIAN  = {code: 7, text: "Croatian"}
    CZECH  = {code: 8, text: "Czech"}
    DANISH  = {code: 9, text: "Danish"}
    DUTCH  = {code: 10, text: "Dutch"}
    ESTONIAN  = {code: 11, text: "Estonian"}
    FINNISH  = {code: 12, text: "Finnish"}
    FRENCH  = {code: 13, text: "French"}
    GERMAN  = {code: 14, text: "German"}
    GREEK  = {code: 15, text: "Greek"}
    HEBREW  = {code: 16, text: "Hebrew"}
    HUNGARIAN  = {code: 17, text: "Hungarian"}
    ICELANDIC  = {code: 18, text: "Icelandic"}
    INDONESIAN  = {code: 19, text: "Indonesian"}
    ITALIAN  = {code: 20, text: "Italian"}
    JAPANESE  = {code: 21, text: "Japanese"}
    KOREAN  = {code: 22, text: "Korean"}
    LAO  = {code: 23, text: "Lao"}
    LATVIAN  = {code: 24, text: "Latvian"} 
    LITHUANIAN  = {code: 25, text: "Lithuanian"}
    MALAY  = {code: 26, text: "Malay"}
    NORWEGIAN  = {code: 27, text: "Norwegian"}
    POLISH  = {code: 28, text: "Polish"}
    PORTUGUESE  = {code: 29, text: "Portuguese"}
    ROMANIAN  = {code: 30, text: "Romanian"}
    RUSSIAN  = {code: 31, text: "Russian"}
    SLOVAK  = {code: 32, text: "Slovak"}
    SPANISH  = {code: 33, text: "Spanish"}
    SWEDISH  = {code: 34, text: "Swedish"}
    TAGALOG  = {code: 35, text: "Tagalog"}
    THAI  = {code: 36, text: "Thai"}
    TURKISH  = {code: 37, text: "Turkish"}
    UKRAINIAN  = {code: 38, text: "Ukrainian"}
    VIETNAMESE  = {code: 39, text: "Vietnamese"}
    OTHER  = {code: 40, text: "Other"}

    def self.language_list
      Song::Language.constants.collect { |language| OpenStruct.new Song::Language.const_get(language)}
    end
  end

  module Genre
    ALTERNATIVE = {code: 1, text: "Alternative"}
    BIGBAND = {code: 2, text: "Big Band"}
    BLUES = {code: 3, text: "Blues"}
    CHILDRENSMUSIC = {code: 4, text: "Childern's Music"} #CHANGE
    CHRISTIANGOSPEL = {code: 5, text: "Christian/Gospel"} #CHANGE
    CLASSICAL = {code: 6, text: "Classical"}
    COMEDY = {code: 7, text: "Comedy"}
    COUNTRY = {code: 8, text: "Country"}
    DANCE = {code: 9, text: "Dance"}
    ELECTRONIC = {code: 10, text: "Electronic"}
    FITNESSANDWORKOUT = {code: 11, text: "Fitness and Workout"} #CHANGE
    FOLK = {code: 12, text: "Folk"}
    FRENCHPOP = {code: 13, text: "French Pop"}
    GERMANFOLK = {code: 14, text: "German Folk"}
    GERMANPOP = {code: 15, text: "German Pop"}
    HIPHOPRAP = {code: 16, text: "Hip Hop/Rap"} #CHANGE
    HOLIDAY = {code: 17, text: "Holiday"}
    JPOP = {code: 18, text: "J-Pop"} #CHANGE
    JAZZ = {code: 19, text: "Jazz"}
    KPOP = {code: 20, text: "K-Pop"} #CHANGE
    LATIN = {code: 21, text: "Latin"}
    METAL = {code: 22, text: "Metal"}
    NEWAGE = {code: 23, text: "New Age"}
    POP = {code: 24, text: "Pop"}
    PUNK = {code: 25, text: "Punk"}
    RBSOUL = {code: 26, text: "R&B/Soul"} #CHANGE
    REGGAE = {code: 27, text: "Reggae"}
    ROCK = {code: 28, text: "Rock"}
    SINGERSONGWRITER = {code: 29, text: "Singer/Songwriter"} #CHANGE
    SOUNDTRACK = {code: 30, text: "Soundtrack"}
    SPOKENWORD = {code: 31, text: "Spoken Word"}
    VOCAL = {code: 32, text: "Vocal"}
    WORLD = {code: 33, text: "World"}

    def self.genre_list
      Song::Genre.constants.collect { |genre| OpenStruct.new Song::Genre.const_get(genre)}
    end
  end
end
