'use strict';

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "35.187.220.189",
    port: 3306,
    user: "vitamin",
    password: "vita1234",
    database: "vitamin"
});

con.connect();

var sql = "select * \
from vi_resume"

con.query(sql, function (err, res) {
    if (err) {
        console.log("에러 발생");
        console.log(err);
        return;
    }
    res.forEach(function(e) {
        console.log(e);
    });
});

con.end();

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