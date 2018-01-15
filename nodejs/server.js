var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
const {evaluate, kNN, sample} = require('nodeml');
var mysql = require('mysql');

var con = mysql.createConnection({
    host: "35.187.220.189",
    port: 3306,
    user: "vitamin",
    password: "vita1234",
    database: "vitamin"
});

let knn = new kNN();

knn.train({'fun': 3, 'couple': 1}, 'comedy');
knn.train({'couple': 1, 'fast': 1, 'fun': 3}, 'comedy');
knn.train({'fast': 3, 'furious': 2, 'shoot': 2}, 'action');
knn.train({'furious': 2, 'shoot': 4, 'fun': 1}, 'action');
knn.train({'fly': 2, 'fast': 3, 'shoot': 2, 'love': 1}, 'action');

var memberNo;
var password;

app.get("/", function (req, res) {
    memberNo = req.query.memberNo;
    password = req.query.password;

    con.connect();

    var sql = "select * \
    from vi_account where account_no = ? and pwd = ?"
    console.log(memberNo, password)

    var queryRes;
    
    con.query(sql, [memberNo, password], function (err, res) {
        if (err) {
            console.log("에러 발생");
            console.log(err);
            return;
        }
        queryRes = res;
    });
    
    con.end(function () {
        console.log(queryRes)
        res.sendfile("client.html");
    });

});

var count = 1;
io.on('connection', function (socket) {
    console.log('user connected:', socket.id);
    var name = "user"+memberNo;

    io.to(socket.id).emit('change name', name);

    socket.on('disconnect', function () {
        console.log('user disconnect', socket.id);
    });

    socket.on('send message', function (name, text) {
        var msg = name+": "+text;
        console.log(msg);

        var obj = {'fun': 3, 'fast': 1, 'love': 1};

        let result = knn.test(obj, true);

        console.log(result);

        knn.train(obj, result[0]);
        
        io.emit('receive message', msg);
    });
});

http.listen('3030', function () {
    console.log('server on');
});