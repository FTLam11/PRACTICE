class Hamming {
  constructor() {}
  unequalStrandLength(strandA, strandB) {
    return strandA.length != strandB.length;
  }
  compute(strandA, strandB) {
    if (this.unequalStrandLength(strandA, strandB)) {
      throw 'DNA strands must be of equal length.';
    }
    
    let delta = 0;
    for (var i = 0; i < strandA.length; i++) {
      if (strandA[i] != strandB[i]) {
        delta++;
      }
    }
    return delta;
  }
}

module.exports = Hamming;