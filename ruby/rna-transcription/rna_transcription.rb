class Complement
  COMPLEMENT = {
    G: 'C',
    C: 'G',
    T: 'A',
    A: 'U' 
  }

  def self.of_dna(nucleotide)
    complement = nucleotide.chars.map { |char| COMPLEMENT[char.to_sym] }
    return '' if complement.include? nil
    complement.join
  end
end

module BookKeeping
  VERSION = 4
end