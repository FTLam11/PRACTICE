var BinaryTree = function(value) {
  this.data = value;
  this.left = null;
  this.right = null;
};

BinaryTree.prototype.insert = function(value) {
  if (value <= this.data) {
    if (this.left) {
      this.left.insert(value);
    } else {
      this.left = new BinaryTree(value);
    }
  } else {
    if (this.right) {
      this.right.insert(value);
    } else {
      this.right = new BinaryTree(value);
    }
  }

  return this;
};

BinaryTree.prototype.contains = function(value) {
  if (value === this.data) return true;
  if (value < this.data && this.left) return this.left.contains(value);
  if (value > this.data && this.right) return this.right.contains(value);
  return false;
};

BinaryTree.prototype.traverseDepthFirstInOrder = function(cb) {
  if (this.left) this.left.traverseDepthFirstInOrder(cb);
  cb(this.data);
  if (this.right) this.right.traverseDepthFirstInOrder(cb);
};

BinaryTree.prototype.traverseDepthFirstPreOrder = function(cb) {
  cb(this.data);
  if (this.left) this.left.traverseDepthFirstPreOrder(cb);
  if (this.right) this.right.traverseDepthFirstPreOrder(cb);
};

BinaryTree.prototype.traverseDepthFirstPostOrder = function(cb) {
  if (this.left) this.left.traverseDepthFirstPreOrder(cb);
  if (this.right) this.right.traverseDepthFirstPreOrder(cb);
  cb(this.data);
};

BinaryTree.prototype.deleteMin = function(parent) {
  if (this.left) return this.left.deleteMin(this);
  if (this.right) {
    var deleted = this.data;
    this.data = this.right.data;
    this.left = this.right.left;
    this.right = this.right.right;
    return deleted;
  };
  parent.left = null;
  return this.data;
};

BinaryTree.prototype.removeNode = function(value) {
  // body...
};

module.exports = BinaryTree;