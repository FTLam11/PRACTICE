var Stack = function() {
  this.data = '';
  this.count = 0;
};

Stack.prototype.push = function(val) {
  this.data = this.data.concat(val, '@@@@@');
  this.count++;
  return this.data;
};

Stack.prototype.pop = function() {
  if (this.data) {
    var dataArr = this.data.split('@@@@@').slice(0, -1);
    var last = dataArr[--this.count];
    dataArr[this.count] = '';
    this.data = dataArr.join('@@@@@');
    return last;
  } else {
    return undefined;
  };
};

Stack.prototype.peek = function() {
  return this.data.split('@@@@@')[this.count - 1];
};

Stack.prototype.size = function() {
  return this.data.split('@@@@@').length - 1;
};

module.exports = Stack;