'use strict';

const expect = require('chai').expect;
const MinStack = require('../minStack');

let money;

describe("MinStack", function() {
  beforeEach(function() {
    money = new MinStack();
  });

  it('has a data property', function() {
    expect(money.data).to.not.be.an('undefined');
  });

  it('stores values', function() {
    expect(money.push(5)).to.eql([5]);
    expect(money.min.peek()).to.eql(5);
    money.push(3);
    money.push(4);
    money.push(2);
    expect(money.min.peek()).to.eql(2);
  });

  it('removes values', function() {
    money.push(1);
    money.push(2);
    expect(money.pop()).to.equal(2);
    expect(money.min.peek()).to.eql(1);
    expect(money.data).to.eql([1]);
  });

  it('returns undefined when there is no data', function() {
    expect(money.pop()).to.be.an('undefined');
  });

  it('keeps track of the last queued item', function() {
    money.push('yo');
    expect(money.peek()).to.equal('yo');
  });

  it('knows how much data is stored', function() {
    money.push('123');
    expect(money.size()).to.equal(1);
  });
});