class ETL
  def self.transform(legacy_data)
    new_data = Hash.new

    legacy_data.each do | points, chars |
      chars.each do | char |
        new_data[char.downcase] = points
      end 
    end

    new_data
  end
end