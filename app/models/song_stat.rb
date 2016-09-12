# == Schema Information
#
# Table name: song_stats
#
#  id                            :integer          not null, primary key
#  reporting_date                :date
#  sale_month                    :string
#  store                         :string
#  artist                        :string
#  title                         :string
#  quantity                      :integer
#  song_album                    :string
#  customer_paid                 :decimal(7, 2)
#  customer_currency             :string
#  country_of_sale               :string
#  songwriter_royalties_withheld :string
#  earnings                      :decimal(7, 2)
#  song_id                       :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class SongStat < ActiveRecord::Base
  belongs_to :song, foreign_key: 'song_id'


  # extend ConvertCsv
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |song_stat_row|
        csv << song_stat_row.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      SongStat.create! row.to_hash
    end
  end

  def self.update_stats
    SongStat.uniq.pluck(:song_id).each do |i|
      song_statistics = SongStat.where(song_id: i)
      views = song_statistics.sum(:quantity)
      downloads = song_statistics.sum(:quantity)
      earnings = song_statistics.sum(:earnings)
      if !Song.find(i).update_attributes(view_count: views, download_count: downloads, income_till_date: earnings)
        return false
      end
    end
      return true
  end

end
