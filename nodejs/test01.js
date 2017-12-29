'use strict';

var startTime = Date.now();

const {evaluate, kNN, sample} = require('nodeml');

let knn = new kNN();

knn.train({'fun': 3, 'couple': 1}, 'comedy');
knn.train({'couple': 1, 'fast': 1, 'fun': 3}, 'comedy');
knn.train({'fast': 3, 'furious': 2, 'shoot': 2}, 'action');
knn.train({'furious': 2, 'shoot': 4, 'fun': 1}, 'action');
knn.train({'fly': 2, 'fast': 3, 'shoot': 2, 'love': 1}, 'action');

let result = knn.test({'fun': 3, 'fast': 1, 'love': 1}, true);
console.log(result);

const bulk = sample.iris();

knn.train(bulk.dataset, bulk.labels);
result = knn.test(bulk.dataset, 1);
let evaluation = evaluate.accuracy(bulk.labels, result);

console.log(evaluation.micro.PRECISION);

console.log((Date.now() - startTime)/1000, "초");