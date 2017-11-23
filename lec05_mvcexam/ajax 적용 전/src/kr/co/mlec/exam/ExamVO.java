package kr.co.mlec.exam;

import java.util.List;

import org.springframework.web.mvc.Type;

public class ExamVO {
	private String name, religion, day, endday, startday, jumin;
	private int no, religionCode, page, gencode, schoolCode, skillCode;
	@Type("Integer")
	private List<Integer> sch, ski, gender;
	@Type("String")
	private List<String> jumin_no, gday;

	@Override
	public String toString() {
		return "ExamVO [name=" + name + ", religion=" + religion + ", day=" + day + ", endday=" + endday + ", startday="
				+ startday + ", jumin=" + jumin + ", no=" + no + ", religionCode=" + religionCode + ", page=" + page
				+ ", gencode=" + gencode + ", schoolCode=" + schoolCode + ", skillCode=" + skillCode + ", sch=" + sch
				+ ", ski=" + ski + ", gender=" + gender + ", jumin_no=" + jumin_no + ", gday=" + gday + "]";
	}
	public int getSkillCode() {
		return skillCode;
	}
	public void setSkillCode(int skillCode) {
		this.skillCode = skillCode;
	}
	public int getSchoolCode() {
		return schoolCode;
	}
	public void setSchoolCode(int schoolCode) {
		this.schoolCode = schoolCode;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public List<String> getJumin_no() {
		return jumin_no;
	}
	public void setJumin_no(List<String> jumin_no) {
		this.jumin_no = jumin_no;
	}
	public List<String> getGday() {
		return gday;
	}
	public void setGday(List<String> gday) {
		this.gday = gday;
	}
	public int getGencode() {
		return gencode;
	}
	public void setGencode(int gencode) {
		this.gencode = gencode;
	}
	public List<Integer> getGender() {
		return gender;
	}
	public void setGender(List<Integer> gender) {
		this.gender = gender;
	}
	public List<Integer> getSch() {
		return sch;
	}
	public void setSch(List<Integer> sch) {
		this.sch = sch;
	}
	public List<Integer> getSki() {
		return ski;
	}
	public void setSki(List<Integer> ski) {
		this.ski = ski;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public int getReligionCode() {
		return religionCode;
	}
	public void setReligionCode(int religionCode) {
		this.religionCode = religionCode;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
}
