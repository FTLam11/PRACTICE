class Bob {
  constructor() {}
  hey(phrase) {
    if (this.shouting(phrase)) {
      return 'Whoa, chill out!';
    } else if (this.asking(phrase)) {
      return 'Sure.';
    } else {
      return 'Whatever.';
    };
  }
  shouting(phrase) {
    return phrase === phrase.toUpperCase();
  }
  asking(phrase) {
    return phrase[phrase.length - 1] === '?';
  }
}

module.exports = Bob;