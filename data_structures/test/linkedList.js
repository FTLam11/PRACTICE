'use strict';

const expect = require('chai').expect;
const LinkedList = require('../linkedList');

let list;

describe("LinkedList", function() {
  beforeEach(function() {
    list = new LinkedList(0);
  });

  it('has a head property', function() {
    expect(list.head).to.not.be.an('undefined');
  });

  it('has a tail property', function() {
    expect(list.tail).to.not.be.an('undefined');
  });

  it('has a looping method', function() {
    expect(list.forEach).to.be.a('function');
  });

  it('prints a list of all contained values', function() {
    expect(list.print()).to.eql('0');
  });

  it('adds nodes to its list', function() {
    let newNode = list.insertAfter(list.head, 1);
    expect(list.head.next).to.eql(newNode);
  });

  it('removes nodes from its list', function() {
    let newNode = list.insertAfter(list.head, 1);
    let removedNode = list.removeAfter(list.head);
    expect(list.head.next).to.be.an('null');
    expect(newNode).to.eql(removedNode);
  });

  it('adds new heads to its list', function() {
    let newNode = list.insertAfter(list.head, 1);
    expect(list.head.next).to.eql(newNode);
  });

  it('removes the head', function() {
    let newNode = list.insertAfter(list.head, 1);
    let oldHead = list.head;
    expect(list.removeHead()).to.eql(oldHead);
    expect(list.head).to.eql(newNode);
  });

  it('allows searching of nodes', function() {
    expect(list.findNode(0)).to.eql(list.head);
    expect(list.findNode(1)).to.eql('Not found');
  });

  it('adds nodes to the tail', function() {
    expect(list.appendToTail(1)).to.eql(list.head.next);
  });  
});