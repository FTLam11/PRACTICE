'use strict';

const expect = require('chai').expect;
const parens = require('../parens');

describe('parens', function() {
  it('handles legal simple expressions', function() {
    expect(parens('(2)')).to.be.true;
  });

  it('handles intermediate expressions', function() {
    expect(parens('{[(2+4)/0.5*20]^2}')).to.be.true;
  });

  it('detects illegal expressions', function() {
    expect(parens('Math.min(5,(6-3))(')).to.be.false;
  });
});