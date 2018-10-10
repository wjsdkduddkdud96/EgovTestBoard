<%--
  Class Name : EgovNoticeInqire.jsp
  Description : 게시물 조회 화면
  Modification Information
 
      수정일      수정자              수정내용
     ----------  --------    ---------------------------
     2009.03.23   이삼섭        최초 생성
     2009.06.26   한성곤        2단계 기능 추가 (댓글관리, 만족도조사)
     2011.08.31   JJY       	경량환경 버전 생성
     2013.05.23   이기하       	상세보기 오류수정
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.23
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
     function onloading() {
        if ("<c:out value='${msg}'/>" != "") {
            alert("<c:out value='${msg}'/>");
        }
    }
    
    function fn_egov_select_noticeList() {
        document.frm.action = "<c:url value='/cop/bbs/EgovIncTopnav.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_delete_notice() {
        if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
            alert('등록시 사용한 패스워드를 입력해 주세요.');
            document.frm.password.focus();
            return;
        }
        
        if (confirm('<spring:message code="common.delete.msg" />')) {
            document.frm.action = "<c:url value='/cop/bbs/deleteTestBoard.do'/>";
            document.frm.submit();
        }   
    }
    
     function fn_egov_moveUpdt_notice() {
       
       
        document.frm.action = "<c:url value='/cop/bbs/updatePageTestBoard.do'/>";
        document.frm.submit();           
    }
    
     function fn_egov_replyWritePage(){
    	 document.frm.action = "<c:url value='/cop/bbs/replyPageTestBoard.do'/>";
         document.frm.submit();
     }

</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/cop/bbs/selectCommentList.do" charEncoding="utf-8">
    <c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/cop/bbs/selectSatisfactionList.do" charEncoding="utf-8">
    <c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
    function fn_egov_addScrap() {
        document.frm.action = "<c:url value='/cop/bbs/addScrap.do'/>";
        document.frm.submit();          
    }
</script>
</c:if>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<title><c:out value='${result.bbsNm}'/> - 글조회</title>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body onload="onloading();">
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
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>게시판TEST</li>
                            <li>&gt;</li>
                            <li><strong>글조회</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>글조회</strong></h2></div>
                </div>
              <c:forEach items="${registTest}" var="result" varStatus="status">
                <form name="frm" method="post" action="<c:url value='/cop/bbs/registTestBoard.do'/>">
                     
                    <input type="hidden" name="testBoard_idx" value="<c:out value='${result.testBoard_idx }'/>"/>
                    <input type="hidden" name="testBoard_no" value="<c:out value='${result.testBoard_no }'/>"/>
                    <input type="hidden" name="testBoard_level" value="<c:out value='${result.testBoard_level }'/>"/>
                    <input type="hidden" name="testBoard_sortNo" value="<c:out value='${result.testBoard_sortNo }'/>"/>

                    <div class="modify_user" >
                        <table>
                        
                          <tr> 
                            <th width="15%" height="23" nowrap >제목</th>
                            <td width="85%" colspan="5" nowrap="nowrap">
                            	<input style="border: 0px; width: 100%;"  type="text" name="testBoard_subject" value="<c:out value='${result.testBoard_subject}' />" readonly/>
                            	<input type="hidden" name="testBoard_idx" value="<c:out value='${result.testBoard_idx}' />"/>
                            </td>
                          </tr>
                          <tr> 
                            <th width="15%" height="23" nowrap >작성자</th>
                            <td width="15%" nowrap="nowrap">
                            <c:out value="${result.testBoard_id}" />

                    
                            </td>
                            <th width="15%" height="23" nowrap >작성시간</th>
                            <td width="15%" nowrap="nowrap"><c:out value="${result.testBoard_date}" />
                            </td>
                            <th width="15%" height="23" nowrap >조회수</th>
                            <td width="15%" nowrap="nowrap"><c:out value="${result.testBoard_hits}" />
                            </td>
                          </tr>    
                          <tr> 
                            <th height="23" >글내용</th>
                            <td colspan="5">
                             <div id="bbs_cn">
                               <textarea id="testBoard_content" name="testBoard_content"  cols="75" rows="20"  style="width:99%; resize:none; border:none;" readonly="readonly" title="글내용"><c:out value="${result.testBoard_content}" escapeXml="true" /></textarea>
                             </div>
                            </td>
                          </tr>
                          
                                            
                          <c:if test="${result.typeNm ne null}">
                          <tr>
                          	<th width="15%" height="23"  nowrap="nowrap">게시판 유형     </th>
                          	<td width="20%" nowrap="nowrap">
                          	<input style="border: 0px;  "  type="text" name="typeNm" value="<c:out value="${result.typeNm}" />" readonly/>
                          	</td>
                          	<th width="15%" height="23"  nowrap="nowrap">게시판 속성</th>
                          	<td width="20%" nowrap="nowrap" colspan="3">
                          		<input style="border: 0px; "  type="text" name="attrNm" value="<c:out value="${result.attrNm}" />" readonly/>
                          	</td>
                          </tr>
                          <tr>
                          <th width="15%" height="23"  nowrap="nowrap">소속 기관 </th>
                          	<td colspan="5">
                          		<c:forEach items="${registCheck }" var="check" varStatus="status">
	                          		<input style="border: 0px; width: 10%; "  type="text" name="soNm" value="<c:out value="${check.testBoard_check_soNm}"/>" readonly/>
                          		</c:forEach>
                          	</td>                          
                          </tr> 
                          </c:if>
                        </table>
                    </div>

                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="buttons" style="padding-top:10px;padding-bottom:10px;">
                      <!-- 목록/저장버튼  -->
                      <table border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                         <c:if test="${result.testBoard_id == sessionScope.LoginVO_name}">     
                              <td>
                                 <a href="#LINK" onclick="javascript:fn_egov_moveUpdt_notice(); return false;">수정</a> 
                              </td>
                              
                              <td width="10"></td>
                              <td>
                                 <a href="#LINK" onclick="javascript:fn_egov_delete_notice(); return false;">삭제</a> 
                              </td>
                         </c:if>    
                          <td width="10"></td>
                          <td>
                              <a href="#LINK" onclick="javascript:fn_egov_replyWritePage(); return false;">답글 작성</a>
                          </td>
                          <td width="10"></td>
                          <td>
                              <a href="#LINK" onclick="javascript:fn_egov_select_noticeList(); return false;">목록</a>
                          </td>
                          
                        </tr>
                      </table>
                    </div>
                    
                    <!-- 버튼 끝 -->                           
                </form>
              </c:forEach>

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
</script>
</html>

