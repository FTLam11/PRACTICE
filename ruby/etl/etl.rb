class ETL
  def self.transform(legacy_data)
    transformed = Hash.new

    legacy_data.values.each do |value|
      value.is_a?(Array) ? 
      swap_each_array_value_with_key(legacy_data, value, transformed) : 
      swap_single_value_with_key(legacy_data, value, transformed)
    end
    
    transformed
  end

  private

  def self.swap_each_array_value_with_key(legacy_data, array, transformed)
    array.each { |e| transformed[e.downcase] = legacy_data.key(array) }
  end

  def self.swap_single_value_with_key(legacy_data, value, transformed)
    transformed[value.downcase] = legacy_data.key([value])
  end
end