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
    expect(money.push('$')).to.equal(1);
    expect(money.data).to.deep.equal({0: '$'});
  });

  it('throws an error when trying to store values while at capacity', function() {
    money.push(1);
    money.push(2);
    expect(function() {
      money.push(3);
    }).to.throw;
  });

  it('removes values', function() {
    money.push('1');
    money.push('2');
    expect(money.pop()).to.equal('2');
    expect(money.data).to.deep.equal({0: '1'});
  });

  it('returns undefined when there is no data', function() {
    expect(money.pop()).to.be.an('undefined');
  });

  it('keeps track of the first queued item', function() {
    money.push('yo');
    expect(money.peek()).to.equal('yo');
  });

  it('keeps track of how much data is stored', function() {
    money.push('123');
    expect(money.size()).to.equal(1);
  });
});