package kr.co.mlec.test;

import org.springframework.web.mvc.Controller;
import org.springframework.web.mvc.RequestMapping;

@Controller
public class TestController {
	@RequestMapping("/test/a.do")
	public void Test01() {
		System.out.println("Test01 메소드 호출 됨.");
	}
}
