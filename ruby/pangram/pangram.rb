class Pangram
  def self.is_pangram?(str)
    return true if str.downcase.gsub(/[\s\d_\."]/, "").split("").uniq.join.length == 26
    false
  end
end