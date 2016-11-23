class Nucleotide
  attr_reader :dna_strand

  def self.from_dna(dna_strand)
    new(dna_strand)
  end

  def count(char)
    dna_strand.count(char)
  end

  def initialize(dna_strand)
    raise ArgumentError unless valid_nucleotides?(dna_strand)
    @dna_strand = dna_strand
  end

  def histogram
    Hash.new.tap do |hash|
      nucleotides.each { |nucleotide| hash[nucleotide] = dna_strand.count(nucleotide) }
    end
  end

  private

  def nucleotides
    %w(A T C G)
  end

  def valid_nucleotides?(dna_strand)
    dna_strand.scan(/[^ATCG]/).empty?
  end
end