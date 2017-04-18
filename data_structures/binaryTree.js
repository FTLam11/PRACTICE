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
  if (!this.left && !this.right) {
    if(parent) {
      var deleted = this.data;
      parent.left = null;
      return deleted;
    } else {
      this.data = null;
    };
  } else if (!this.left && this.right) {
    if (parent) {
      var deleted = this.data;
      parent.left = this.right;
      return deleted;
    } else {
      this.data = this.right.data;
      this.right = this.right.right;
    };
  };
  if (this.left) return this.left.deleteMin(this);
};

BinaryTree.prototype.removeNode = function(value) {
  if (this.data === value) return this.delete(value, this);
  if (this.left) this.left.removeNode(value);
  if (this.right) this.right.removeNode(value);
  return !this.contains(value);
};

BinaryTree.prototype.delete = function(value, parent) {
  if (parent.data === this.data) {
    this.data = null;
    this.left = null;
    this.right = null;
    return true;
  };
  var parentShip = (this.data === parent.left.data ? 'left' : 'right');
  var childShip = (this.left ? 'left' : 'right');
  if (!this.left && !this.right) {
    parent[parentShip] = null;
  } else if (this.left && !this.right || !this.left && this.right) {
    parent[parentShip] = this[childShip];
  } else {
    parent[parentShip] = this.right;
    parent[parentShip].left = this.left;
  };
  return true;
};

module.exports = BinaryTree;