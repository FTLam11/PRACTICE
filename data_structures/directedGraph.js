var DirectedGraph = function() {
  this.data = [];
};

DirectedGraph.prototype.addVertex = function(value) {
  this.data[value] = this.data[value] || [];
  for (var i = 0; i < this.data.length; i++) {
    if (!this.data[i]) this.data[i] = [];
    for (var j = 0; j < this.data.length; j++) {
      this.data[i][j] = this.data[i][j] || 0;
    };
  };
};

DirectedGraph.prototype.removeVertex = function(value) {
  this.data.forEach(function(vertex) {
    vertex[value] = 0;
  });
  this.data[value] = null;
};

DirectedGraph.prototype.contains = function(value) {
  return !!this.data[value]; 
};

DirectedGraph.prototype.addEdge = function(from, to) {
  this.data[from][to] = 1;
  this.data[to][from] = -1;
};

DirectedGraph.prototype.removeEdge = function(value1, value2) {
  this.data[value1][value2] = 0;
  this.data[value2][value1] = 0;
};

DirectedGraph.prototype.hasEdge = function(value1, value2) {
  return !!this.data[value1][value2];
};

module.exports = DirectedGraph;