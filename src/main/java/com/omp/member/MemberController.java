package com.omp.member;

import java.net.URLEncoder;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omp.repository.domain.Member;
import com.omp.repository.service.MailService;
import com.omp.repository.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MailService mailService;

	@RequestMapping("/main.do")
	public String main() throws Exception {
		return "member/main";
	}

	@RequestMapping("/login.do")
	public String login() throws Exception {
		return "member/login";
	}

	@RequestMapping("/email.do")
	public String email() throws Exception {
		return "member/email";
	}

	@ResponseBody
	@RequestMapping("/insert.json")
	public void insert(Member member) throws Exception {
		Random r = new Random();
		String ra = "";
		for (int i = 0; i < 6; i++) {
			int ran = r.nextInt(11171)+44033;
			ra += (char)ran;
		}
		member.setEmailKey(ra);
		memberService.insert(member);
		mailService.sendMail("im490113@gmail.com", member.getEmail1() + member.getEmail2(), "회원 가입 인증 번호", ra);
	}

	@ResponseBody
	@RequestMapping("/emailcha.json")
	public boolean emailcha(Member member) throws Exception {
		if (memberService.memchk(member) != null) {
			Random r = new Random();
			String ra = "";
			for (int i = 0; i < 6; i++) {
				int ran = r.nextInt(11171)+44033;
				ra += (char)ran;
			}
			member.setEmailKey(ra);
			memberService.memcha(member);
			mailService.sendMail("im490113@gmail.com", member.getEmail1() + member.getEmail2(), "회원 가입 인증 번호", ra);
			return true;
		} else {
			return false;
		}
	}

	@ResponseBody
	@RequestMapping("/emailchk.json")
	public boolean emailchk(Member member) throws Exception {
		if (memberService.memchk(member) != null && member.getEmailKey() != null) {
			memberService.up(member.getId());
			return true;
		} else {
			return false;
		}
	}

	@ResponseBody
	@RequestMapping("/login.json")
	public boolean loginAjax(Member member, boolean chk, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		member = memberService.login(member);
		if (member != null) {
			Cookie c = new Cookie("id", null);
			c.setMaxAge(0);

			if (chk) {
				c = new Cookie("id", URLEncoder.encode(member.getId(), "utf-8"));
				c.setMaxAge(60 * 60 * 24);
				response.addCookie(c);
			}

			HttpSession session = request.getSession();
			session.setAttribute("user", member);

			return true;
		} else {
			logout(request);
			return false;
		}
	}

	@ResponseBody
	@RequestMapping("/logout.json")
	public void logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
	}

	@ResponseBody
	@RequestMapping("/main.json")
	public boolean mainAjax(String id) throws Exception {
		if (memberService.jungBok(id) == null)
			return true;
		else
			return false;
	}

}
