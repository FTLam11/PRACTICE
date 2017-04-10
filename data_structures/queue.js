var Queue =  function(capacity) {
  this.capacity = capacity || Infinity;
  this.data = {};
  this.count = 0;
};

Queue.prototype.push = function(val) {
  if (this.count < this.capacity) {
    this.data[this.count++] = val;
    return this.count;
  } else {
    throw new Error('Capacity reached.');
  };
};

Queue.prototype.pop = function() {
  if (this.count > 0) {
    var val = this.data[--this.count];
    delete this.data[this.count];
    return val;
  } else {
    return undefined;
  };
};

Queue.prototype.peek = function() {
  return this.data[0];
};

Queue.prototype.size = function() {
  return this.count;
};

module.exports = Queue;