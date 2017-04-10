'use strict';

const expect = require('chai').expect;
const Stack = require('../stack');

let money;

describe("Stack", function() {
  beforeEach(function() {
    money = new Stack();
  });

  it('has a data property', function() {
    expect(money.data).to.not.be.an('undefined');
  });

  it('stores values', function() {
    expect(money.push('$')).to.equal('$@@@@@');
  });

  it('removes values', function() {
    money.push('1');
    money.push('2');
    expect(money.pop()).to.equal('2');
    expect(money.data).to.equal('1@@@@@');
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