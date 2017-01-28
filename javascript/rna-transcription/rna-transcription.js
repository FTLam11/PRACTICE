class DnaTranscriber {
  constructor() {}
  toRna(strand) {
    let rnaStrand = '';

    for (let i = 0; i < strand.length; i++) {
      rnaStrand += this.transcribe(strand[i]);
    }

    return rnaStrand;
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