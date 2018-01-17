'use strict';

const {CF, evaluation, Bayes} = require('nodeml');
var mysql = require('mysql');

var con = mysql.createConnection({
    host: "35.187.220.189",
    port: 3306,
    user: "vitamin",
    password: "vita1234",
    database: "vitamin"
});

/* var sql = "select * \
from (SELECT member_no as a_mno, recruit_no a_recno, resume_no a_resno, introduction_no as a_ino, state as a_s \
FROM vi_company_apply where state = 1) A \
inner join (SELECT member_no as m_mno, account_no as m_ano, gender as m_gender \
FROM vi_member) B \
on A.a_mno = B.m_mno \
inner join (SELECT recruit_no as c_mno, company_no as c_cno, career_state, career_start, career_end, school_level, year_pay_start, year_pay_end, age_count_start, age_count_end, gender, assigned_task, form_service, recruit_count, address_no, day_of_week \
FROM vi_recruit_write) C \
on A.a_recno = C.c_mno \
inner join vi_company D \
on C.c_cno = D.company_no" */

let bayes = new Bayes();

var sql = "select * \
from (SELECT member_no as a_mno, recruit_no a_recno, resume_no a_resno, introduction_no as a_ino, state as a_s \
FROM vi_company_apply) A \
inner join (SELECT member_no as m_mno, account_no as m_ano, gender \
FROM vi_member) B \
on A.a_mno = B.m_mno \
inner join vi_resume \
on vi_resume.member_no = a_mno";

con.query(sql, function (err, res) {
    if (err) {
        console.log("에러 발생");
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
    
    let result = bayes.test({m_mno: 30,
        gender: 1,
        job_state: 1,
        marry_state: 1,
        bohoon_state: 1,
        support_state: 1,
        school_level_no: 1,
        career_years: 1}, {score: true});
    console.log(result);
});

con.end();