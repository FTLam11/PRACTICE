class Hamming {
  constructor() {}
  compute(strandA, strandB) {
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