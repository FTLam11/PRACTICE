'use strict';

const expect =  require('chai').expect;
const reverse = require('../reverse');

describe('Reverse', function() {
  it('reverses a blank string', function() {
    expect(reverse.word('')).to.equal('');
  });

  it('reverses a one character string', function() {
    expect(reverse.word('a')).to.equal('a');
  });

  it('reverses a two character string', function() {
    expect(reverse.word('ab')).to.equal('ba');
  });

  it('reverses a tree character string', function() {
    expect(reverse.word('abc')).to.equal('cba');
  });

  it('reverses a long strings', function() {
    expect(reverse.word('racecar')).to.equal('racecar');
  });

  it('reverses arrays', function() {
    expect(reverse.arr([0,1,2,3])).to.deep.equal([3,2,1,0]);
  });
});