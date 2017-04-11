module.exports = function selectionSort(collection) {
  var sortedCollection = [];
  var currItem;

  while(collection.length) {
    currItem = collection[0];
    for (var i = 0; i < collection.length; i++) {
      if (collection[i] < currItem) {
        currItem = collection[i];
      };
    };

    sortedCollection.push(currItem);
    collection.splice(collection.indexOf(currItem), 1);
  };

  return sortedCollection;
};