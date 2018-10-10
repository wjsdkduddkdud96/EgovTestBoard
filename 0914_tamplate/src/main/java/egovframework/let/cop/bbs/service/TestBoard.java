package egovframework.let.cop.bbs.service;

import java.io.Serializable;
import java.sql.Date;

import com.mysql.fabric.xmlrpc.base.Array;

@SuppressWarnings("serial")
public class TestBoard implements Serializable {
	
	/* 게시물 번호 */
	private int testBoard_idx;
	
	/* 게시물 작성아이디 */
	private String testBoard_id="";
	
	/* 게시물 제목 */
	private String testBoard_subject="";
	
	/* 게시물 내용 */
	private String testBoard_content="";
	
	/* 게시물 등록날짜 */
	private Date testBoard_date;
	
	/* 게시물 조회수 */
	private int testBoard_hits=0;
	
	/*게시물 검색어*/
	private String testBoard_search="";
	
	/*게시물 검색카테고리*/
	private int testBoard_searchSelect=0;

	/* 현재페이지 */
    private int pageindex = 1;
    
    /* 페이지갯수 */
    private int pageunit = 10;

    /* 페이지사이즈 */
    private int pagesize = 10;

    /* 첫페이지 인덱스 */
    private int firstindex = 1;
    
    /* 마지막페이지 인덱스 */
    private int lastindex = 1;

	/* 페이지당 레코드 개수 */
    private int recordcountPerPage = 10;

    /* 레코드 번호 */
    private int rowno = 0;
    
    /*글 레벨*/
    private int testBoard_level = 0;
    
    /*정렬 번호*/
    private int testBoard_sortNo = 1;
    
    /*삭제 여부*/
    private String testBoard_delYN = "N";
    
    /*글 정렬*/
    private int testBoard_no = 1;
    
    /* 유형코드*/
	private String typeNm = "";

	/* 속성코드 */
	private String attrNm = "";
	
	/* 소속기관코드 */
	/*private String[] testBoard_check_soNm={};
	private String soNm="";*/
	private String[] soNm={};
	private String testBoard_check_soNm ="";
	private int testBoard_check_idx = 0;


	

	public String[] getSoNm() {
		return soNm;
	}

	public void setSoNm(String[] soNm) {
		this.soNm = soNm;
	}

	public String getTestBoard_check_soNm() {
		return testBoard_check_soNm;
	}

	public void setTestBoard_check_soNm(String testBoard_check_soNm) {
		this.testBoard_check_soNm = testBoard_check_soNm;
	}

	public int getTestBoard_check_idx() {
		return testBoard_check_idx;
	}

	public void setTestBoard_check_idx(int testBoard_check_idx) {
		this.testBoard_check_idx = testBoard_check_idx;
	}

	/*public String getSoNm() {
		return soNm;
	}

	public void setSoNm(String soNm) {
		this.soNm = soNm;
	}*/

	public String getTypeNm() {
		return typeNm;
	}

	public void setTypeNm(String typeNm) {
		this.typeNm = typeNm;
	}

	public String getAttrNm() {
		return attrNm;
	}

	public void setAttrNm(String attrNm) {
		this.attrNm = attrNm;
	}

	
	/*public String[] getTestBoard_check_soNm() {
		return testBoard_check_soNm;
	}

	public void setTestBoard_check_soNm(String[] testBoard_check_soNm) {
		this.testBoard_check_soNm = testBoard_check_soNm;
	}*/

	public int getTestBoard_level() {
		return testBoard_level;
	}

	public void setTestBoard_level(int testBoard_level) {
		this.testBoard_level = testBoard_level;
	}

	public int getTestBoard_sortNo() {
		return testBoard_sortNo;
	}

	public void setTestBoard_sortNo(int testBoard_sortNo) {
		this.testBoard_sortNo = testBoard_sortNo;
	}



	public String getTestBoard_delYN() {
		return testBoard_delYN;
	}

	public void setTestBoard_delYN(String testBoard_delYN) {
		this.testBoard_delYN = testBoard_delYN;
	}

	public int getTestBoard_no() {
		return testBoard_no;
	}

	public void setTestBoard_no(int testBoard_no) {
		this.testBoard_no = testBoard_no;
	}

	public int getPageunit() {
		return pageunit;
	}

	public void setPageunit(int pageunit) {
		this.pageunit = pageunit;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getFirstindex() {
		return firstindex;
	}

	public void setFirstindex(int firstindex) {
		this.firstindex = firstindex;
	}

	public int getLastindex() {
		return lastindex;
	}

	public void setLastindex(int lastindex) {
		this.lastindex = lastindex;
	}

	public int getRecordcountPerPage() {
		return recordcountPerPage;
	}

	public void setRecordcountPerPage(int recordcountPerPage) {
		this.recordcountPerPage = recordcountPerPage;
	}

	public int getRowno() {
		return rowno;
	}

	public void setRowno(int rowno) {
		this.rowno = rowno;
	}

	public int getPageindex() {
		return pageindex;
	}

	public void setPageindex(int pageindex) {
		this.pageindex = pageindex;
	}

	public int getTestBoard_searchSelect() {
		return testBoard_searchSelect;
	}

	public void setTestBoard_searchSelect(int testBoard_searchSelect) {
		this.testBoard_searchSelect = testBoard_searchSelect;
	}

	public String getTestBoard_search() {
		return testBoard_search;
	}

	public void setTestBoard_search(String testBoard_search) {
		this.testBoard_search = testBoard_search;
	}

	public int getTestBoard_idx() {
		return testBoard_idx;
	}

	public void setTestBoard_idx(int testBoard_idx) {
		this.testBoard_idx = testBoard_idx;
	}

	public String getTestBoard_id() {
		return testBoard_id;
	}

	public void setTestBoard_id(String testBoard_id) {
		this.testBoard_id = testBoard_id;
	}

	public String getTestBoard_subject() {
		return testBoard_subject;
	}

	public void setTestBoard_subject(String testBoard_subject) {
		this.testBoard_subject = testBoard_subject;
	}

	public String getTestBoard_content() {
		return testBoard_content;
	}

	public void setTestBoard_content(String testBoard_content) {
		this.testBoard_content = testBoard_content;
	}

	public Date getTestBoard_date() {
		return testBoard_date;
	}

	public void setTestBoard_date(Date testBoard_date) {
		this.testBoard_date = testBoard_date;
	}

	public int getTestBoard_hits() {
		return testBoard_hits;
	}

	public void setTestBoard_hits(int testBoard_hits) {
		this.testBoard_hits = testBoard_hits;
	}

}
