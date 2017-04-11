module.exports = function bubbleSort(collection) {
  var finished;

  while (finished != true) {
    finished = true;
    for (var i = 0; i < collection.length - 1; i++) {
      if (collection[i] > collection[i + 1]) {
        var temp = collection[i];
        collection[i] = collection[i + 1];
        collection[i + 1] = temp;
        finished = false;
      };      
    };
  };

  return collection;
};