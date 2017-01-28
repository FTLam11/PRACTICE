class Bob {
  constructor() {}
  hey(phrase) {
    if (this.shouting(phrase)) {
      return 'Whoa, chill out!';
    } else if (this.asking(phrase)) {
      return 'Sure.';
    } else if (this.silence(phrase)) {
      return 'Fine. Be that way!';
    } else {
      return 'Whatever.';
    };
  }
  shouting(phrase) {
    return phrase === phrase.toUpperCase() &&
      /[a-zA-Z]/.test(phrase);
  }
  asking(phrase) {
    return phrase[phrase.length - 1] === '?';
  }
  silence(phrase) {
    return /^\s+/.test(phrase) || phrase === '';
  }
}

module.exports = Bob;