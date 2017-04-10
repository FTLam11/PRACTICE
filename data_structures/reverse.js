var obj = {};

// pass state as argument
obj.word = function reverse(word, result = '') {
  if (!word.length) return result;
  result += word[word.length - 1];
  word = word.slice(0, -1);
  return reverse(word, result);
};

// use closure and side effects
obj.arr = function (arr) {
  var reversedArr = [];

  function populate() {
    if (!arr.length) return;
    reversedArr.push(arr.pop());
    populate(arr);
  };

  populate();

  return reversedArr;
};

module.exports = obj;