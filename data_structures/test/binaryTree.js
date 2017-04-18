'use strict';

const expect = require('chai').expect;
const BinaryTree = require('../binaryTree');

let tree;
let output;

describe("BinaryTree", function() {
  beforeEach(function() {
    output = [];
    tree = new BinaryTree(0);
    tree
      .insert(-5)
      .insert(-3)
      .insert(9)
      .insert(7)
      .insert(6)
  });

  it('adds children to the correct side', function() {
    expect(tree.left.data).to.eql(-5);
    expect(tree.left.right.data).to.eql(-3);
    expect(tree.right.data).to.eql(9);
    expect(tree.right.left.data).to.eql(7);
    expect(tree.right.left.left.data).to.eql(6);
    expect(tree.right.left.left.left).to.be.a('null');
    expect(tree.right.left.left.right).to.be.a('null');
  });

  it('allows searching for a specific value', function() {
    expect(tree.contains(4)).to.be.false;
    expect(tree.contains(6)).to.be.true;
  });

  it('traverses itself in order', function() {
    tree.traverseDepthFirstInOrder(function(tree) {
      output.push(tree);
    });
    expect(output).to.eql([-5, -3, 0, 6, 7, 9]);
  });

  it('traverses itself in pre-order', function() {
    tree.traverseDepthFirstPreOrder(function(tree) {
      output.push(tree);
    });
    expect(output).to.eql([0, -5, -3, 9, 7, 6]);
  });

  it('traverses itself in post-order', function() {
    tree.traverseDepthFirstPostOrder(function(tree) {
      output.push(tree);
    });
    expect(output).to.eql([-5, -3, 9, 7, 6, 0]);
  });

  it('deletes the tree containing the smallest value', function() {
    tree.insert(-7);
    expect(tree.deleteMin(this)).to.eql(-7);
    expect(tree.deleteMin(this)).to.eql(-5);
    expect(tree.deleteMin(this)).to.eql(-3);
  });

  it('deletes a specific value from itself', function() {
    tree.insert(-7);
    expect(tree.removeNode(6)).to.be.true;
    expect(tree.contains(6)).to.be.false;
    expect(tree.removeNode(-5)).to.be.true;
    expect(tree.contains(-5)).to.be.false;
    expect(tree.removeNode(0)).to.be.true;
    expect(tree.data).to.be.a('null');
    expect(tree.left).to.be.a('null');
    expect(tree.right).to.be.a('null');
  });
});