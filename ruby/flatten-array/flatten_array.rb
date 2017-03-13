class FlattenArray
  def self.flatten(list)
    return list.compact if unnested?(list)

    next_list = Array.new.tap do |arr|
      list.each { |el| el.is_a?(Array) ? el.each { |e| arr.push(e) } : arr.push(el) }
    end

    self.flatten(next_list)
  end

  def self.unnested?(list)
    list.select { |e| e.is_a?(Array) }.empty?
  end

  VERSION = 1
end