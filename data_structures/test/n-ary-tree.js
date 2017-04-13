'use strict';

const expect = require('chai').expect;
const nAryTree = require('../n-ary-tree');

let tree;

describe('n-ary-tree', function() {

  beforeEach(function() {
    tree = new nAryTree(1);
  });

  it('has data', function() {
    expect(tree.data).to.not.be.a('null');
  });

  it('has children', function() {
    expect(tree.children).to.not.be.a('null');
  });

  it('stores other trees', function() {
    var child = tree.addChild(2);
    expect(tree.children).to.include(child);
  });

  it('checks itself for a specific value', function() {
    var child1 = tree.addChild(2);
    var child2 = tree.addChild(3);
    var child3 = child1.addChild(4);
    var child4 = child1.addChild(5);
    var child5 = child4.addChild(6);
    var child6 = child2.addChild(7);
    expect(tree.contains(6)).to.be.true;
    expect(tree.contains(9)).to.be.false;
  })
});