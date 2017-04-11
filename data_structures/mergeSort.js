module.exports = function mergeSort(arr) {
  if (arr.length < 2) return arr;
  var left = arr.splice(0, Math.floor(arr.length/2));
  var right = arr;
  var leftSorted = mergeSort(left);
  var rightSorted = mergeSort(right);
  return merge(leftSorted, rightSorted);
};

function merge(larr, rarr) {
  var lcounter = 0;
  var rcounter = 0;
  var sorted = [];

  while(sorted.length != (larr.length + rarr.length)) {
    if (lcounter === larr.length) sorted = sorted.concat(rarr.slice(rcounter));
    else if (rcounter === rarr.length) sorted = sorted.concat(larr.slice(lcounter));
    else if (larr[lcounter] < rarr[rcounter]) sorted.push(larr[lcounter++]); 
    else sorted.push(rarr[rcounter++]);
  };

  return sorted;
};