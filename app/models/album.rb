# == Schema Information
#
# Table name: albums
#
#  id              :integer          not null, primary key
#  album_name      :string
#  musician_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  stage_band_name :string
#  release_date    :date
#  record_label    :string
#  album_cover     :string
#  language        :integer
#  primary_genre   :integer
#  secondary_genre :integer
#

class Album < ActiveRecord::Base
  belongs_to :musician, class_name: User.name
  has_many :songs
  has_many :order_items

  validates_presence_of :album_name, :musician_id, :stage_band_name, :album_cover, :language, :primary_genre
  validates_numericality_of :musician_id, :language, :primary_genre, :secondary_genre

  validates_inclusion_of :language, :in => 1..40
  validates_inclusion_of :primary_genre, :in => 0..33
  validates_inclusion_of :secondary_genre, :in => 0..33

  mount_uploader :album_cover, AlbumCoverUploader

  module Language
    ENGLISH = {code: 1, text: "English"}
    ARABIC  = {code: 2, text: "Arabic"}
    CATALAN  = {code: 3, text: "Arabic"}
    CANTONESE  = {code: 4, text: "Cantonese"}
    CHINESE_SIM  = {code: 5, text: "Chinese(Simplified)"}
    CHINESE_TRAD  = {code: 6, text: "Chinese(Traditional)"}
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
      Album::Language.constants.collect { |language| OpenStruct.new Album::Language.const_get(language)}
    end
  end

  module Genre
    SELECT_GENRE= {code: 0, text: "Select a genre"}
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
      Album::Genre.constants.collect { |genre| OpenStruct.new Album::Genre.const_get(genre)}
    end
  end

end
