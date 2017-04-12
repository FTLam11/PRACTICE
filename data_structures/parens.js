'use strict';

const Stack = require('./stack');
const KEY = {
  '{': '}',
  '}': '{',
  '[': ']',
  ']': '[',
  '(': ')',
  ')': '('
}

module.exports = function(str) {
  var parens = str.split('').filter(function(char) {
    return ['{', '}', '[', ']', '(', ')'].includes(char);
  });
  var ltor = new Stack(), rtol = new Stack();
  parens.forEach((char) => ltor.push(char));
  parens.reverse().forEach((char) => rtol.push(char));
  var legit = true;

  while(ltor.count > 0 && legit) {
    if (KEY[ltor.peek()] === rtol.peek()) {
      ltor.pop();
      rtol.pop();
    } else {
      legit = false;
    };
  };

  return legit;
};