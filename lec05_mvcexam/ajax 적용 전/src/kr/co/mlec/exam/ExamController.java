package kr.co.mlec.exam;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.mvc.Controller;
import org.springframework.web.mvc.ModelAndView;
import org.springframework.web.mvc.RequestMapping;
import org.springframework.web.mvc.RequestParam;

@Controller
public class ExamController {
	
	@RequestMapping("/exam/modifyForm.do")
	public ModelAndView modifyForm(int no) {		
		ExamDAO dao = new ExamDAO();
		List<ExamVO> rel = dao.normal("rel");	
		List<ExamVO> sch = dao.normal("sch");
		List<ExamVO> ski = dao.normal("ski");
		ExamVO vo = dao.det(no);
		System.out.println(vo);
		
		vo.setGday(Arrays.asList(vo.getDay().split("-")));
		vo.setJumin_no(Arrays.asList(vo.getJumin().split("-")));
		
		ModelAndView mav = new ModelAndView("/exam/modifyForm.jsp");
		mav.addAttribute("rel", rel);
		mav.addAttribute("sch", sch);
		mav.addAttribute("ski", ski);
		mav.addAttribute("exam", vo);
		
		return mav;
	}
	
	@RequestMapping("/exam/modify.do")
	public String modify(ExamVO vo) {		
		ExamDAO dao = new ExamDAO();
		vo.setJumin(vo.getJumin_no().get(0)+"-"+vo.getJumin_no().get(1));
		String s = "";
		int i = 0;
		for (String a : vo.getGday()) {
			if(a.length() == 1)
				s += "0";
			s += a;
			if(i != (vo.getGday().size()-1))
				s += "-";
			i++;
		}
		vo.setDay(s);
		dao.modify(vo);
		
		for (int q : dao.modi(vo.getNo())) {
			boolean chk = false;
			int qq = 0;
			for (int w : vo.getSki()) {
				if(w == q) {
					chk = true;
					qq = w;
					break;
				}
			}
			
			if(!chk) {
				ExamVO v = new ExamVO();
				v.setNo(vo.getNo());
				v.setSkillCode(q);
				
				if(dao.jj(v) > 0)
					dao.modi(v);
			}
		}
		
		//vo.getSki = 입력 받은 스킬
		//dao.modi(vo.getNo()) = 기존 스킬
		
		for (int q : vo.getSki()) {
			boolean chk = false;
			int qq = 0;
			for (int w : dao.modi(vo.getNo())) {
				if(w == q) {
					chk = true;
				}
			}
			
			if(!chk) {
				ExamVO v = new ExamVO();
				v.setNo(vo.getNo());
				v.setSkillCode(q);
				
				System.out.println(v.getNo());
				System.out.println(v.getSkillCode());
				dao.skin(v);
			}
		}
		
		return "redirect:/exam/main.do";
	}
	
	@RequestMapping("/exam/insertForm.do")
	public ModelAndView insertForm() {
		ExamDAO dao = new ExamDAO();
		List<ExamVO> rel = dao.normal("rel");	
		List<ExamVO> sch = dao.normal("sch");
		List<ExamVO> ski = dao.normal("ski");
		
		ModelAndView mav = new ModelAndView("/exam/insertForm.jsp");
		mav.addAttribute("rel", rel);
		mav.addAttribute("sch", sch);
		mav.addAttribute("ski", ski);
		
		return mav;
	}
	
	@RequestMapping("/exam/insert.do")
	public String insert(ExamVO vo) throws Exception {
		ExamDAO dao = new ExamDAO();
		int no = dao.no();
		vo.setNo(no);
		vo.setJumin(vo.getJumin_no().get(0)+"-"+vo.getJumin_no().get(1));
		String s = "";
		int i = 0;
		for (String a : vo.getGday()) {
			if(a.length() == 1)
				s += "0";
			s += a;
			if(i != (vo.getGday().size()-1))
				s += "-";
			i++;
		}
		vo.setDay(s);
		dao.stin(vo);
		
		for (int q : vo.getSki()) {
			ExamVO v = new ExamVO();
			v.setNo(no);
			v.setSkillCode(q);
			dao.skin(v);
		}
		
		return "redirect:/exam/main.do";
	}
	
	@RequestMapping("/exam/delete.do")
	public String delete(int no) throws Exception {
		new ExamDAO().del(no);
		return "redirect:/exam/main.do";
	}
	
	@RequestMapping("/exam/main.do")
	public ModelAndView list() {
		ExamDAO dao = new ExamDAO();
		List<ExamVO> rel = dao.normal("rel");	
		List<ExamVO> sch = dao.normal("sch");
		List<ExamVO> ski = dao.normal("ski");
		ExamVO date = dao.date();
		
		ModelAndView mav = new ModelAndView("/exam/main.jsp");
		mav.addAttribute("rel", rel);
		mav.addAttribute("sch", sch);
		mav.addAttribute("ski", ski);
		mav.addAttribute("date", date);
		
		return mav;
	}
	
	@RequestMapping("/exam/search.do")
	public ModelAndView search(ExamVO vo,
		@RequestParam(name="page", defaultValue="1") int page) throws Exception {
		ExamDAO dao = new ExamDAO();
		
		List<Integer> gender = vo.getGender();
		if(gender != null) {
			if(gender.size() > 2)
				vo.setGencode(0);
			else
				vo.setGencode(gender.get(0));
		}
		
		if(vo.getName() != null)
		if(vo.getName().equals(""))
			vo.setName(null);

		vo.setPage(page);

		List<ExamVO> list = dao.search(vo);
		int size = dao.size(vo);
		int lsize = (size%5 == 0) ? size/5 : size/5+1;

		ModelAndView mav = new ModelAndView("/exam/main.do");
		if(list.size() > 0) {
			mav.addAttribute("list", list);
		} else {
			mav.addAttribute("msg", "검색된 결과가 없습니다.");
		}
		mav.addAttribute("page", page);
		mav.addAttribute("size", size);
		mav.addAttribute("lsize", lsize);
		
		return mav;
	}
}
