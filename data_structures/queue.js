var Queue =  function(capacity) {
  this.capacity = capacity || Infinity;
  this.data = {};
  this.head = 0;
  this.tail = 0;
};

Queue.prototype.enqueue = function(val) {
  if (this.count() < this.capacity) {
    this.data[this.tail++] = val;
    return this.count();
  } else {
    throw new Error('Capacity reached.');
  };
};

Queue.prototype.dequeue = function() {
  var val = this.data[this.head];
  delete this.data[this.head];
  if (this.head < this.tail) this.head++;
  return val;
};

Queue.prototype.peek = function() {
  return this.data[this.head];
};

Queue.prototype.count = function() {
  return this.tail - this.head;
};

module.exports = Queue;