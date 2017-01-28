class Bob {
  constructor() {}
  hey(phrase) {
    if (this.shouting(phrase)) {
      return 'Whoa, chill out!';
    } else {
      return 'Whatever.';
    }
  }
  shouting(phrase) {
    return phrase === phrase.toUpperCase();
  }
}

module.exports = Bob;