var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var mysql = require('mysql');
const {CF, evaluation, Bayes} = require('nodeml');

var con = mysql.createConnection({
    host: "35.187.220.189",
    port: 3306,
    user: "vitamin",
    password: "vita1234",
    database: "vitamin"
});

var sql2 = "select * \
from (SELECT member_no as a_mno, recruit_no a_recno, resume_no a_resno, introduction_no as a_ino, state as a_s \
FROM vi_company_apply) A \
inner join (SELECT member_no as m_mno, account_no as m_ano, gender \
FROM vi_member) B \
on A.a_mno = B.m_mno \
inner join vi_resume \
on vi_resume.member_no = a_mno";

let bayes = new Bayes();

con.query(sql2, function (err, res) {
    if (err) {
        console.log("에러 발생1");
        return;
    }
    
    for (let i = 0; i < res.length; i++) {
        bayes.train({
            "m_mno": res[i]["m_mno"],
            "gender": res[i]["gender"] == 'm' ? 1 : 2,
            "job_state": res[i]["job_state"],
            "marry_state": res[i]["marry_state"],
            "bohoon_state": res[i]["bohoon_state"],
            "support_state": res[i]["support_state"],
            "school_level_no": res[i]["school_level_no"],
            "career_years": res[i]["career_years"]
        }, res[i]["a_recno"]);
    } 
});

var memberNo;
var password;

app.get("/", function (req, res1) {
    memberNo = req.query.memberNo;
    password = req.query.password;

    var sql = "select * \
    from vi_account where account_no = ? and pwd = ?"

    var queryRes;

    console.log(memberNo, password);

    con.query(sql, [memberNo, password], function (err, res2) {
        if (err) {
            console.log("에러 발생2");
            console.log(err)
            return;
        }
        queryRes = res2;
        console.log("로그인 성공");


        var sql3 = "select * \
        from (SELECT member_no as a_mno, recruit_no a_recno, resume_no a_resno, introduction_no as a_ino, state as a_s \
        FROM vi_company_apply where member_no = ?) A \
        inner join (SELECT member_no as m_mno, account_no as m_ano, gender \
        FROM vi_member) B \
        on A.a_mno = B.m_mno \
        inner join vi_resume \
        on vi_resume.member_no = a_mno";

        con.query(sql3, [38], function (err, res3) {
            if (err) {
                console.log("에러 발생3");
                console.log(err)
                return;
            }
            var result = bayes.test({
                "m_mno": res3[0]["m_mno"],
                "gender": res3[0]["gender"] == 'm' ? 1 : 2,
                "job_state": res3[0]["job_state"],
                "marry_state": res3[0]["marry_state"],
                "bohoon_state": res3[0]["bohoon_state"],
                "support_state": res3[0]["support_state"],
                "school_level_no": res3[0]["school_level_no"],
                "career_years": res3[0]["career_years"]
            }, {score: true});

            console.log(result.answer);

            var civa = result["score"];

            var machineData = [];
            for (var key in civa) {
                machineData.push({"value": civa[key], "recruit_no": key, "member_no": memberNo});
            }

            var sql4 = "delete from vi_machine \
            where member_no = ?";

            con.query(sql4, [memberNo], function (err, res5) {
                if (err) console.log("에러 aaaaa");
            })

            var sql5 = "insert into vi_machine (value, recruit_no, member_no) \
            values (?, ?, ?)";

            machineData.forEach(function (data) {
                con.query(sql5, [data.value, data.recruit_no, memberNo], function (err, res5) {
                    if (err) console.log("에러 ㅂㅂㅂㅂㅂ");
                })
            });
        });
    });

    res1.redirect('http://localhost:8080/vitamin/search/searchRecruit.do');
});

http.listen('3030', function () {
    console.log('server on');
});