class Crypto
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    message.gsub(/\W/, '').downcase
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map { |slice| slice.join('') }
  end

  def ciphertext
    size.times.map do |i|
      plaintext_segments.map { |segment| segment[i] }.join
    end.join
  end

  def normalize_ciphertext
    size.times.map do |i|
      plaintext_segments.map { |segment| segment[i] }.join
    end.join(" ")
  end
end