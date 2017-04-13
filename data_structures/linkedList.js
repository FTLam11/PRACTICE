var LinkedList = function (value) {
  this.head = new Node(value);
  this.tail = this.head;
};

function Node(value) {
  this.data = value;
  this.next = null;
};

LinkedList.prototype.forEach = function(cb) {
  var node = this.head;

  while(node) {
    cb(node.data);
    node = node.next;
  };
};

LinkedList.prototype.print = function() {
  var result = [];

  this.forEach(function(item) {
    result.push(item);
  });

  return result.join(', ');
};

LinkedList.prototype.insertAfter = function(refNode, value) {
  var oldNode = refNode.next;
  var newNode = new Node(value);
  refNode.next = newNode;
  newNode.next = oldNode;

  if(this.tail === refNode) this.tail = newNode;
  return newNode;
};

LinkedList.prototype.removeAfter = function(refNode) {
  var removedNode = refNode.next;

  if(!removedNode) return 'Nothing to remove.';
  var newNode = removedNode.next;
  refNode.next = newNode;
  removedNode.next = null;
  if(this.tail === removedNode) this.tail = refNode;
  return removedNode;
};

LinkedList.prototype.insertHead = function(value) {
  var newNode = new Node(value);
  var oldHead = this.head;

  newNode.next = oldHead;
  this.head = newNode;
  return this.head;
};

LinkedList.prototype.removeHead = function() {
  var oldHead = this.head;
  var newHead = oldHead.next;

  this.head = newHead;
  oldHead.next = null;
  return oldHead;
};

LinkedList.prototype.findNode = function(value) {
  var node = this.head;

  while(node) {
    if (node.data === value) return node;
    node = node.next;
  };

  return 'Not found';
};

LinkedList.prototype.appendToTail = function(value) {
  var newTail = new Node(value);
  var node = this.head;

  while(node.next) {
    node = node.next;
  };

  node.next = newTail;
  return newTail;
};

module.exports = LinkedList;