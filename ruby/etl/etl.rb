class ETL
  def self.transform(legacy_data)

    legacy_data.map do | points, chars |
      points, chars = chars, points
    end

    legacy_data

  end
end