<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<!-- script type="text/javascript" src="<c:url value='/html/egovframework/cmm/utl/htmlarea/EgovWebEditor.js'/>" ></script-->
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">

    function fn_egov_validateForm(obj) {
        return true;
    }

    function fn_egov_regist_notice() {
        //document.board.onsubmit();
        
        if (confirm('<spring:message code="common.regist.msg" />')) {
            document.board.action = "<c:url value='/cop/bbs/replyTestBoard.do'/>";
            document.board.submit();                    
        }
    }
    
    function fn_egov_select_noticeList() {
        document.board.action = "<c:url value='/cop/bbs/EgovIncTopnav.do'/>";
        document.board.submit();    
    }
</script>
<style type="text/css">
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  .noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  .noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
<title><c:out value='${bdMstr.bbsNm}'/> - 답글쓰기</title>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>

<!-- body onload="javascript:editor_generate('nttCn');"-->
<!-- <body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; document.board.nttSj.focus();"> -->
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
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>게시판TEST</li>
                            <li>&gt;</li>
                            <li><strong>답글쓰기</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>답글쓰기</strong></h2></div>
                </div>
                
                <form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
                	<input type="hidden" name="testBoard_idx" value="<c:out value='${testBoard.testBoard_idx }'/>"/>
                	<input type="hidden" name="testBoard_no" value="<c:out value='${testBoard.testBoard_no }'/>"/>
                    <input type="hidden" name="testBoard_level" value="<c:out value='${testBoard.testBoard_level }'/>"/>
                    <input type="hidden" name="testBoard_sortNo" value="<c:out value='${testBoard.testBoard_sortNo }'/>"/>
                    

                    <div class="modify_user" >
                        <table>
                          <tr> 
                            <th width="20%" height="23" nowrap ><LABEL for="nttSj"><spring:message code="cop.nttSj" /></LABEL>
                                <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required">
                            </th>
                            <td width="80%" nowrap colspan="3">
                              <input id="testBoard_subject" name="testBoard_subject" type="text" size="60" value="RE: <c:out value='${testBoard.testBoard_subject}'/>"  maxlength="60" > 
                              <br/><form:errors path="nttSj" />
                            </td>
                          </tr>
                          <tr> 
                            <th height="23" ><LABEL for="nttCn"><spring:message code="cop.nttCn" /></LABEL>
                                <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required">
                            </th>
                            <td colspan="3">
                              <textarea id="testBoard_content" name="testBoard_content" class="textarea"  cols="75" rows="20"  style="width:99%;"></textarea> 
                              <form:errors path="nttCn" />
                            </td>
                          </tr>
                        </table>  
                        <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">  
                        <script type="text/javascript">
                         var maxFileNum = document.board.posblAtchFileNumber.value;
                         if (maxFileNum==null || maxFileNum=="") {
                             maxFileNum = 3;
                         }
                         var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
                         multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );         
                         </script>
                         </c:if>
                    </div>

                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="buttons" style="padding-top:10px;padding-bottom:10px;">
                      <!-- 목록/저장버튼  -->
                      <table border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                             
                                  <td>
                                    <a href="#LINK" onclick="javascript:fn_egov_regist_notice(); return false;"><spring:message code="button.save" /></a> 
                                  </td>
                                  <td width="10"></td>
                      
                              <td>
                                <a href="#LINK" onclick="javascript:fn_egov_select_noticeList(); return false;"><spring:message code="button.list" /></a> 
                              </td>
                        </tr>
                      </table>
                    </div>
                    <!-- 버튼 끝 -->                           

                </form:form>

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
</html>

