<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >

<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
<c:choose>
<c:when test="${preview == 'true'}">

</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<title><c:out value="${brdMstrVO.bbsNm}"/> 목록</title>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
    .dateTD{ width: 50px;}
    #subTd{text-align: left;}
</style>

</head>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    

<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>        
    <!-- //header 끝 --> 
    
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/sym/mms/EgovMainMenuLeft.do" /></div>
       
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">
             <form name="frm" action ="<c:url value='/cop/bbs/EgovIncTopnav.do'/>" method="post" enctype="multipart/form-data">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li><strong>게시판TEST</strong></li>
                        </ul>
                    </div>
                </div>
                
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong><c:out value="게시판"/></strong></h2></div>
					
						<!-- <input type="hidden" id="aaa" name="aaa" value=""/> -->
						 <%-- <input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" /> --%>
						<input type="hidden" name="nttId"  value="0" />
						<%-- <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" /> --%>
						<input name="pageindex" type="hidden" value="<c:out value='${testBoard.pageindex}'/>"/>
                        <input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" />
                
                        <fieldset><legend>조건정보 영역</legend>    
                        <div class="sf_start">
                            <ul id="search_first_ul">
                                <li>
								    <select name="testBoard_searchSelect" class="select" title="검색조건 선택">
								           <option value="0" <c:if test="${searchSelect == '0'}">selected="selected"</c:if> >제목</option>
								           <option value="1" <c:if test="${searchSelect == '1'}">selected="selected"</c:if> >내용</option>             
								           <option value="2" <c:if test="${searchSelect == '2'}">selected="selected"</c:if> >작성자</option>            
								    </select>
                                </li>
                                <li>
                                    <input name="testBoard_search" type="text" size="35" value='<c:out value="${search}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력"> 
                                </li>
                            </ul>
                            <ul id="search_second_ul">
                                <li>
                                    <div class="buttons" style="float:right;">
                                        <a href="#noscript" onclick="fn_egov_search(); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" />조회 </a>
                                        <a href="<c:url value='/cop/bbs/testBoardInsert.do'/>">등록</a>                                       
                                    </div>                              
                                </li>
                            </ul>           
                        </div>          
                        </fieldset>
             
                </div>
                <!-- //검색 필드 박스 끝 -->
                <div id="page_info"><div id="page_info_align"></div></div>                    
                <!-- table add start -->
                <div class="default_tablestyle">
                    <table summary="번호, 제목, 작성자, 작성일, 조회수   입니다" cellpadding="0" cellspacing="0" id="boardTestTable">
                    <caption>게시물 목록</caption>
                    <colgroup>
                    <col width="10%" >
                    <col width="44%" >  
                    
                    <col width="15%" >
                    <col width="8%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap">번호</th>
                        <th scope="col" nowrap="nowrap">제목</th>
                            <th scope="col" nowrap="nowrap">작성자</th>
                        <th scope="col" nowrap="nowrap" >작성일</th>
                        <th scope="col" nowrap="nowrap">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach items="${selectTest }" var="item" varStatus="status">
                		<tr>
                			<%-- <td>${status.count }</td> --%>
                			<td>${paginationInfo.totalRecordCount+1 - ((testBoard.pageindex-1) * testBoard.pagesize + status.count)}</td>
                			<td id="subTd">
                			<c:if test="${item.testBoard_level !=0}">
				                <c:forEach begin="0" end="${item.testBoard_level}" step="1">
				                    &nbsp;
				                </c:forEach>
				                <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow">
				            </c:if>
                			
                			
                			<c:if test="${item.testBoard_delYN == 'N'}">
                			<a class="testBoardSub" href=#LINK onclick="fn_egov_regist(${item.testBoard_idx}); return false;">${item.testBoard_subject }</a>
                			</c:if>
                			<c:if test="${item.testBoard_delYN != 'N'}">
                			${item.testBoard_subject }
                			</c:if>
                			</td>
                			<td>${item.testBoard_id }
                				<input type="hidden" name="idx_${item.testBoard_idx }" value="${item.testBoard_idx} }"/>
                			</td>
                			<td style="overflow: visible;">${item.testBoard_date}</td>
                			<td>${item.testBoard_hits }</td>
                		</tr>
                	</c:forEach>
                    <input type="hidden" name="idx" value=""/>
                    </tbody>
                    
                    </table>
                  
                </div>
                

                <!-- 페이지 네비게이션 시작 -->
                <div id="paging_div">
                    <ul class="paging_align">
                        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />  
                    </ul>
                </div>                      
                <!-- //페이지 네비게이션 끝 -->  
                <%-- <c:out value="${selectTest}"></c:out> --%>
                
                
				</form>
            </div>
            <!-- //content 끝 -->    
        </div>     
        <!-- //container 끝 -->
          
        <!-- footer 시작 -->
        <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
        <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->

 </body>
 <script>
 var login =" ${sessionScope.LoginVO}";

if(login == " "){
	console.log("로그인 안됨");
	location.href="<c:url value='/uat/uia/actionMain.do'/>"
}

//검색(조회버튼)
function fn_egov_search(){
	 
	 document.frm.action = "<c:url value='/cop/bbs/EgovIncTopnav.do'/>";
	 document.frm.submit();  
}

//상세보기
function fn_egov_regist(idx){    
	console.log(idx);
	 document.frm.action = "<c:url value='/cop/bbs/registTestBoard.do'/>";
	 document.frm.idx.value = idx;
    document.frm.submit();
}

//리스트
function fn_egov_select_noticeList(pageNo) {
	console.log(pageNo);
    document.frm.pageindex.value = pageNo;
    document.frm.action = "<c:url value='/cop/bbs/EgovIncTopnav.do'/>";
    document.frm.submit();  
}
</script>
</html>