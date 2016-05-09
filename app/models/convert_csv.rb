module ConvertCsv

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |song_stat_row|
        csv << song_stat_row.attributes.values_at(*column_names)
      end
    end
  end

end
