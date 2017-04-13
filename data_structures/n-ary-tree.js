var Tree = function(value) {
  this.data = value;
  this.children = [];
};

Tree.prototype.addChild = function(value) {
  var child = new Tree(value);
  this.children.push(child);
  return child;
};

Tree.prototype.contains = function(value) {
  if (this.data === value) return true;
  if (this.children.length === 0) return false;
  for (var i = 0; i < this.children.length; i++) {
    if (this.children[i].contains(value)) return true;
  };

  return false;
};

module.exports = Tree;