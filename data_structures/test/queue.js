'use strict';

const expect = require('chai').expect;
const Queue = require('../queue');

let money;

describe("Queue", function() {
  beforeEach(function() {
    money = new Queue(2);
  });

  it('has a data property', function() {
    expect(money.data).to.not.be.an('undefined');
  });

  it('stores values', function() {
    expect(money.enqueue('$')).to.equal(1);
    expect(money.data).to.deep.equal({0: '$'});
  });

  it('throws an error when trying to store values while at capacity', function() {
    money.enqueue(1);
    money.enqueue(2);
    expect(function() {
      money.enqueue(3);
    }).to.throw;
  });

  it('removes values from the front', function() {
    money.enqueue('1');
    money.enqueue('2');
    expect(money.dequeue()).to.equal('1');
    expect(money.data).to.deep.equal({1: '2'});
  });

  it('returns undefined when there is no data', function() {
    expect(money.dequeue()).to.be.an('undefined');
  });

  it('keeps track of the first queued item', function() {
    money.enqueue('yo');
    expect(money.peek()).to.equal('yo');
  });

  it('keeps track of how much data is stored', function() {
    money.enqueue('123');
    expect(money.count()).to.equal(1);
  });
});