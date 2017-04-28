'use strict';

const expect = require('chai').expect;
const Graph = require('../directedGraph');

let graph;

describe('Directed Graph', function() {
  beforeEach(function() {
    graph = new Graph();
  });

  it('stores data', function() {
    expect(graph.data).to.not.be.a('null');
  });

  it('stores vertices', function() {
    graph.addVertex(1);
    graph.addVertex(2);
    expect(graph.data).to.eql([[0, 0, 0], [0, 0, 0], [0, 0, 0]]);
  });

  it('does not add an existing vertex', function() {
    graph.addVertex(1);
    let obj = { graph: graph.data }
    let fn = function() { graph.addVertex(1) };
    expect(fn).to.not.change(obj, 'graph');
  });

  it('removes vertices', function() {
    graph.addVertex(1);
    graph.addVertex(2);
    graph.removeVertex(1);
    expect(graph.data[1]).to.be.a('null');
  });

  it('removes linked edges when a vertex is removed', function() {
    graph.addVertex(0);
    graph.addVertex(1);
    graph.addVertex(2);
    graph.addEdge(0, 1);
    graph.addEdge(0, 2);
    graph.removeVertex(0);
    expect(graph.contains(0)).to.be.false;
    expect(graph.data[1]).to.eql([0, 0, 0]);
    expect(graph.data[2]).to.eql([0, 0, 0]);
  });

  it('searches for specific values', function() {
    graph.addVertex(1);
    expect(graph.contains(1)).to.be.true;
    expect(graph.contains(10)).to.be.false;
  });

  it('adds edges to describe relations between vertices', function() {
    graph.addVertex(1);
    graph.addVertex(2);
    graph.addEdge(1, 2);
    expect(graph.data[1]).to.eql([0, 0, 1]);
    expect(graph.data[2]).to.eql([0, -1, 0]);
  });

  it('removes edges', function() {
    graph.addVertex(1);
    graph.addVertex(2);
    graph.addEdge(1, 2);
    graph.removeEdge(1, 2);
    expect(graph.data[1]).to.eql([0, 0, 0]);
    expect(graph.data[2]).to.eql([0, 0, 0]);
  });

  it('checks vertices for an edge', function() {
    graph.addVertex(1);
    graph.addVertex(2);
    graph.addEdge(1, 2);
    expect(graph.hasEdge(1,2)).to.be.true;
    expect(graph.hasEdge(1,3)).to.be.false;
  });
});