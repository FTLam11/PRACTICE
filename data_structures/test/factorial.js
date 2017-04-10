'use strict';

const expect = require('chai').expect;
const factorial = require('../factorial');

describe("Factorial", function() {
  it('computes the factorial of 0', function() {
    expect(factorial(0)).to.equal(1);
  });

  it('computes the factorial of 1', function() {
    expect(factorial(1)).to.equal(1);
  });

  it('computes the factorial of 2', function() {
    expect(factorial(2)).to.equal(2);
  });

  it('computes medium factorials', function() {
    expect(factorial(8)).to.equal(40320);
  });

  it('computes large factorials', function() {
    expect(factorial(20)).to.equal(2432902008176640000);
  });
});