// Undirected graph
var Graph = function() {
  this.data = {};
};

Graph.prototype.addVertex = function(value) {
  if (this.data[value]) return 'Vertex already exists';
  this.data[value] = [];
};

Graph.prototype.removeVertex = function(value) {
  if (this.data[value]) {
    this.data[value].forEach(function(adjacent) {
      var connected = this.data[adjacent];
      var index = connected.indexOf(value);
      connected.splice(index, 1);
    }.bind(this));
    delete this.data[value];
  } else {
    return 'Vertex not found';
  };
};

Graph.prototype.contains = function(value) {
  return !!this.data[value];
};

Graph.prototype.addEdge = function(value1, value2) {
  if (!this.data[value1]) this.addVertex(value1);
  if (!this.data[value2]) this.addVertex(value2);
  if (!this.data[value1].includes(value2)) this.data[value1].push(value2);
  if (!this.data[value2].includes(value1)) this.data[value2].push(value1);
};

Graph.prototype.removeEdge = function(value1, value2) {
  if (!this.data[value1] || !this.data[value2]) return false;
  this.data[value1].splice(this.data[value1].indexOf(value2), 1);
  this.data[value2].splice(this.data[value2].indexOf(value1), 1);
};

Graph.prototype.hasEdge = function(value1, value2) {
  if (this.data[value1].includes(value2) && this.data[value2].includes(value1)) return true;
  return false;
};

Graph.prototype.forEach = function(cb) {
  for (var vertex in this.data) {
    cb(vertex, this.data[vertex], this.data);
  };
};

module.exports = Graph;