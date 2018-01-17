'use strict';

const {evaluate, Bayes, sample} = require('nodeml');

// train data and test

let bayes = new Bayes();

bayes.train({'fun': 3, 'couple': 1}, 'ff');
bayes.train({'couple': 1, 'fast': 1, 'fun': 3}, 'ff');
bayes.train({'fast': 3, 'furious': 2, 'shoot': 2}, 'ss');
bayes.train({'furious': 2, 'shoot': 4, 'fun': 1}, 'qq');
bayes.train({'fly': 2, 'fast': 3, 'shoot': 2, 'love': 1}, 'ss');

let result = bayes.test({'fun': 3, 'fast': 3, 'shoot': 2}, {score: true});
console.log(result);