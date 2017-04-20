'use strict';

const expect = require('chai').expect;
const Graph = require('../graph');

let graph;

describe('Graph', function() {
  beforeEach(function() {
    graph = new Graph();
  });

  it('stores data', function() {
    expect(graph.data).to.not.be.a('null');
  });

  it('stores vertices', function() {
    graph.addVertex(1);
    graph.addVertex(2);
    expect(graph.data).to.include.keys('1', '2');
  });

  it('does not add an existing vertex', function() {
    graph.addVertex(1);
    expect(graph.addVertex(1)).to.eql('Vertex already exists');
  });

  it('removes vertices', function() {
    graph.addVertex(1);
    graph.addVertex(2);
    graph.removeVertex(1);
    expect(graph.data).to.not.include.keys('1');
    expect(graph.removeVertex(3)).to.eql('Vertex not found');
  });

  it('removes linked edges when a vertex is removed', function() {
    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.removeVertex(1);
    expect(graph.contains(1)).to.be.false;
    expect(graph.data[2].includes(1)).to.be.false;
    expect(graph.data[3].includes(1)).to.be.false;
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
    expect(graph.data[1].includes(2)).to.be.true;
    expect(graph.data[2].includes(1)).to.be.true;
  });

  it('adds vertices and edges when vertices do not exist', function() {
    graph.addEdge(1, 2);
    expect(graph.contains(1)).to.be.true;
    expect(graph.contains(2)).to.be.true;
    expect(graph.data[1].includes(2)).to.be.true;
    expect(graph.data[2].includes(1)).to.be.true;
  });

  it('removes edges', function() {
    graph.addEdge(1, 2);
    graph.removeEdge(1, 2);
    expect(graph.data[1].includes(2)).to.be.false;
    expect(graph.data[2].includes(1)).to.be.false;
  });

  it('checks vertices for an edge', function() {
    graph.addEdge(1, 2);
    expect(graph.hasEdge(1,2)).to.be.true;
    expect(graph.hasEdge(1,3)).to.be.false;
  });
});