function Stack() {
  this.data = [];
  this.count = 0;
};

Stack.prototype.push = function(val) {
  this.count++;
  return this.data.push(val);
};

Stack.prototype.pop = function() {
  if (!this.count) return;
  this.count--;
  return this.data.pop();
};

Stack.prototype.peek = function() {
  return this.data[this.count - 1];
};

Stack.prototype.size = function() {
  return this.count;
};

var MinStack = function() {
  this.data = [];
  this.count = 0;
  this.min = new Stack();
};

MinStack.prototype.push = function(val) {
  if (!this.count || val < this.min.peek()) {
    this.min.push(val);
  } else {
    this.min.push(this.min.peek());
  };
  this.data.push(val);
  this.count++;
  return this.data;
};

MinStack.prototype.pop = function() {
  this.min.pop();
  return this.data.pop();
};

MinStack.prototype.peek = function(first_argument) {
  return this.data[this.count - 1];
};

MinStack.prototype.size = function() {
  return this.count;
};

module.exports = MinStack;

