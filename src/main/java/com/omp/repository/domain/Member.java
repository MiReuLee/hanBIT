package com.omp.repository.domain;

public class Member {

	private Integer memberNo;

	private String id;

	private String pass;

	private String name;

	private String email1;

	private String email2;

	private String emailKey;

	private Integer fileNo;

	private String address;

	private String authority;

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getEmailKey() {
		return emailKey;
	}

	public void setEmailKey(String emailKey) {
		this.emailKey = emailKey;
	}

	public Integer getFileNo() {
		return fileNo;
	}

	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	// Member 모델 복사
	public void CopyData(Member param) {
		this.memberNo = param.getMemberNo();
		this.id = param.getId();
		this.pass = param.getPass();
		this.name = param.getName();
		this.email1 = param.getEmail1();
		this.email2 = param.getEmail2();
		this.emailKey = param.getEmailKey();
		this.fileNo = param.getFileNo();
		this.address = param.getAddress();
		this.authority = param.getAuthority();
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", id=" + id + ", pass=" + pass + ", name=" + name + ", email1="
				+ email1 + ", email2=" + email2 + ", emailKey=" + emailKey + ", fileNo=" + fileNo + ", address="
				+ address + ", authority=" + authority + "]";
	}

	
}
