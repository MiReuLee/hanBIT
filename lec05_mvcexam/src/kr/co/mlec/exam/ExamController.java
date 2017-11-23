package kr.co.mlec.exam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.mvc.Controller;
import org.springframework.web.mvc.ModelAndView;
import org.springframework.web.mvc.RequestMapping;
import org.springframework.web.mvc.RequestParam;

@Controller
public class ExamController {
	
	@RequestMapping("/exam/modifyForm.json")
	public Map<String, Object> modifyForm(int no) {	
		ExamDAO dao = new ExamDAO();
		List<ExamVO> rel = dao.normal("rel");	
		List<ExamVO> sch = dao.normal("sch");
		List<ExamVO> ski = dao.normal("ski");
		ExamVO vo = dao.det(no);
		
		vo.setGday(Arrays.asList(vo.getDay().split("-")));
		vo.setJumin_no(Arrays.asList(vo.getJumin().split("-")));
		
		Map<String, Object> map = new HashMap<>();
		map.put("rel", rel);
		map.put("sch", sch);
		map.put("ski", ski);
		map.put("exam", vo);
		
		return map;
	}
	
	@RequestMapping("/exam/modify.json")
	public void modify(ExamVO vo) {
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
				
				dao.skin(v);
			}
		}
	}
	
	@RequestMapping("/exam/insertForm.json")
	public Map<String, Object> insertForm() {
		ExamDAO dao = new ExamDAO();
		List<ExamVO> rel = dao.normal("rel");	
		List<ExamVO> sch = dao.normal("sch");
		List<ExamVO> ski = dao.normal("ski");
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("rel", rel);
		map.put("sch", sch);
		map.put("ski", ski);
		
		return map;
	}
	
	@RequestMapping("/exam/insert.json")
	public void insert(ExamVO vo) throws Exception {
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
	}
	
	@RequestMapping("/exam/delete.json")
	public void delete(int no) throws Exception {
		new ExamDAO().del(no);
	}
	
	@RequestMapping("/exam/main.json")
	public List<Object> list() {
		ExamDAO dao = new ExamDAO();
		List<ExamVO> rel = dao.normal("rel");	
		List<ExamVO> sch = dao.normal("sch");
		List<ExamVO> ski = dao.normal("ski");
		ExamVO date = dao.date();
		
		List<Object> list = new ArrayList<>();
		
		list.add(rel);
		list.add(sch);
		list.add(ski);
		list.add(date);
		
		return list;
	}
	
	@RequestMapping("/exam/search.json")
	public Map<String, Object> search(ExamVO vo,
		@RequestParam(name="page", defaultValue="1") int page) throws Exception {
		ExamDAO dao = new ExamDAO();
		
		
		List<Integer> gender = vo.getGender();
		if(gender != null) {
			if(gender.size() > 2)
				vo.setGencode(0);
			else
				vo.setGencode(gender.get(0));
		}
		
		if (vo.getEndday() == "") {
			vo.setEndday(null);
		}
		
		if (vo.getStartday() == "") {
			vo.setStartday(null);
		}
		
		if(vo.getName() != null)
		if(vo.getName().equals(""))
			vo.setName(null);

		vo.setPage(page);

		List<ExamVO> list = dao.search(vo);
		int size = dao.size(vo);
		int lsize = (size%5 == 0) ? size/5 : size/5+1;

		Map<String, Object> map = new HashMap<>();
		
		if(list.size() > 0) {
			map.put("list", list);
		} else {
			map.put("msg", "검색된 결과가 없습니다.");
		}
		map.put("page", page);
		map.put("size", size);
		map.put("lsize", lsize);
		
		return map;
	}
}
