class DnaTranscriber {
  constructor() {}
  toRna(strand) {
    return strand
      .split('')
      .map((nucleotide) => {
        return this.transcribe(nucleotide);
      })
      .join('');
  }
  transcribe(nucleotide) {
    switch (nucleotide) {
      case 'G':
        return 'C';
      case 'C':
        return 'G';
      case 'T':
        return 'A';
      case 'A':
        return 'U';
    }
  }
}

module.exports = DnaTranscriber;