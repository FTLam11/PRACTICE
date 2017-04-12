module.exports = function quickSort(list) {
  if (list.length === 1) return list;
  var pivot = 0;
  var temp;

  for (var i = 1; i < list.length; i++) {
    if (list[pivot] > list[i]) {
      temp = list.splice(i, 1)[0];
      list.splice(pivot++, 0, temp);
    };
  };

  var small = list.splice(0, pivot + 1);
  var large = list;

  if (!large.length) {
    return quickSort(small);
  } else {
    small = quickSort(small);
    large = quickSort(large);
  }
  return small.concat(large);
};

