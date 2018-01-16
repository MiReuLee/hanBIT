'use strict';

const {CF, evaluation} = require('nodeml');
var mysql = require('mysql');

var con = mysql.createConnection({
    host: "35.187.220.189",
    port: 3306,
    user: "vitamin",
    password: "vita1234",
    database: "vitamin"
});

var sql = "select * \
from (SELECT member_no as a_mno, recruit_no a_recno, resume_no a_resno, introduction_no as a_ino, state as a_s \
FROM vi_company_apply where state = 1) A \
inner join (SELECT member_no as m_mno, account_no as m_ano, gender as m_gender \
FROM vi_member) B \
on A.a_mno = B.m_mno \
inner join (SELECT recruit_no as c_mno, company_no as c_cno, career_state, career_start, career_end, school_level, year_pay_start, year_pay_end, age_count_start, age_count_end, gender, assigned_task, form_service, recruit_count, address_no, day_of_week \
FROM vi_recruit_write) C \
on A.a_recno = C.c_mno \
inner join vi_company D \
on C.c_cno = D.company_no"

con.query(sql, function (err, res) {
    if (err) {
        console.log("에러 발생");
        return;
    }
    
    /* console.log(res) */
    
    let train = [];
    for (let i = 0; i < res.length; i++) {
        train.push(res[i]);
    }
    
    const cf = new CF();

    cf.maxRelatedItem = 10;
    cf.maxRelatedUser = 50;

    cf.train(train, 'm_mno', 'a_recno', 'career_start', 'career_end', 'school_level');
    var test = [{a_recno: 23,
        m_mno: 10,
        career_state: 1,
        career_start: -1,
        career_end: -1,
        school_level: -1}]
    let gt = cf.gt(test, 'm_mno', 'a_recno', 'career_start', 'career_end', 'school_level');
    let gtr = {};
    let users = [];
    for (let user in gt) {
        gtr[user] = gt[user];
        users.push(user);
        if (users.length === 100) break;
    }
    
    let result = cf.recommendToUsers(users, 40);
    
    console.log(result);

    let ndcg = evaluation.ndcg(gtr, result);
    console.log(ndcg);
});

con.end();