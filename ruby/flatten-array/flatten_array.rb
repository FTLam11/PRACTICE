class FlattenArray
  def self.flatten(list)
    return list.compact if unnested?(list)
    temp = Array.new
    list.each do |el|
      el.is_a?(Array) ? el.each { |x| temp.push(x) } : temp.push(el)
    end
    self.flatten(temp)
  end

  def self.unnested?(list)
    list.select { |e| e.is_a?(Array) }.empty?
  end

  VERSION = 1
end