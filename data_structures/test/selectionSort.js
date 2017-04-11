'use strict';

const expect = require('chai').expect;
const selectionSort = require('../selectionSort');

describe('selectionSort', function() {
  it('sorts a collection containing one element', function() {
    expect(selectionSort([1])).to.eql([1]);
  });

  it('sorts a collection containing two elements', function() {
    expect(selectionSort([2, 1])).to.eql([1, 2]);
  });

  it('sorts a medium sized collection', function() {
    expect(selectionSort([6,0,0,7,6])).to.eql([0,0,6,6,7]);
  });

  it('sorts a large sized collection', function() {
    expect(selectionSort([4,5,6,3,2,1,8,9,0,7])).to.eql([0,1,2,3,4,5,6,7,8,9]);
  });
});