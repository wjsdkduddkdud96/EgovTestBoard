<%--
  Class Name : EgovNoticeRegist.jsp
  Description : 게시물  생성 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.24   이삼섭              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.24
--%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    function fn_egov_validateForm(obj) {
        return true;
    }
    
    function fn_egov_regist_notice() {
    	var size = "${soNmSize}";
        if($("#testBoard_subject").val()=="" || $("#testBoard_content").val()==""){
    		alert("제목과 내용을 모두 입력해주세요.");
    	}else if("${testBoard.testBoard_level}" == "0" ){
    		console.log("aaa");
        	  if($("input:checkbox:checked").length == 0){
    			alert("소속 기관을 선택해주세요.");
    		}else{
        		console.log("asd");
              	 if (confirm('<spring:message code="common.update.msg" />')) {
              		console.log("ggg");
           		 document.board.action = "<c:url value='/cop/bbs/updateTestBoard.do'/>";
                    document.board.submit();                   
                }
       		} 	    	
    	}else{
    		console.log("asd");
       	 if (confirm('<spring:message code="common.update.msg" />')) {
       		console.log("ggg");
    		 document.board.action = "<c:url value='/cop/bbs/updateTestBoard.do'/>";
             document.board.submit();                   
         }
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
<title><c:out value='${bdMstr.bbsNm}'/> - 게시글쓰기</title>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>

<!-- body onload="javascript:editor_generate('nttCn');"-->
<!-- <body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; document.board.nttSj.focus();"> -->
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header_mainsize"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
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
                            <li><strong>게시글쓰기</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>게시글쓰기</strong></h2></div>
                </div>

                <form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
                
                
 				
                    <div id="border" class="modify_user" >
                        <table >
                            <tr>
                                <th width="20%" height="23"  nowrap="nowrap"><label for="nttSj"><spring:message code="cop.nttSj" /></label>
                                    <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required"/>
                                </th>
                                <td width="80%" nowrap colspan="3">
                                	<input type="hidden" name="testBoard_idx" value="${testBoard.testBoard_idx }"/>
                                  <input id="testBoard_subject" name="testBoard_subject" type="text" size="60" value="${testBoard.testBoard_subject}"  maxlength="60" > 
                                  <br/><form:errors path="nttSj" />
                                </td>
                            </tr>
                            <tr> 
                                <th height="23" ><label for="nttCn"><spring:message code="cop.nttCn" /></label>
                                    <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required"/>
                                </th>
                                <td colspan="3">
                                  <textarea id="testBoard_content" name="testBoard_content" class="textarea" cols="75" rows="20" style="width:99%; resize:none;">${testBoard.testBoard_content}</textarea> 
                                  <form:errors path="testBoard_content" />
                                </td>
                            </tr>
                            
                            <c:if test="${soNmSize ne 0}">
                            
                            <tr>
                            	<th width="15%" height="23"  nowrap="nowrap">
                            		게시판 유형
                            	</th>
                            	<td>
                            		<c:forEach items="${typeList }" var="type" varStatus="status">
	                               		${type.codeNm} <input type="radio" id="typeNm_${status.count}" name="typeNm" value="${type.codeNm}"  <c:if test="${type.codeNm == testBoard.typeNm}">checked="checked"</c:if>/> &nbsp;

	                               	
	                               	</c:forEach>

                            	</td>
                            	
                            	<th width="15%" height="23"  nowrap="nowrap">
                            		게시판 속성 
                            	</th>
                            	<td>
                            		<select name="attrNm" class="select" title="게시판 속성 선택" style="width:100px;">  
	                            		<c:forEach items="${attrbList }" var="item" varStatus="status">
									           <option value="${item.codeNm}" <c:if test="${item.codeNm == testBoard.attrNm}">selected="selected"</c:if>>${item.codeNm}</option>  
									    </c:forEach>          
								    </select>
								    
                            	</td>
                            </tr>
                            <tr>
                            	<th width="15%" height="23"  nowrap="nowrap">
                            		소속기관
                            		
                            	</th>
                            	<td>  
                            	
                            		<c:forEach items="${soList }" var="soList" varStatus="status">
                            			<%-- <form:checkbox path="soNm" value="${soList.codeNm}" label="${soList.codeNm}"/> --%>
	                               		${soList.codeNm} <input type="checkbox" id="soNm_${status.index }" name="soNm" value="${soList.codeNm}" /> &nbsp;
	                               	</c:forEach>
	                               	
	                               	<c:forEach items="${testBoard.soNm }" var="soNm" varStatus="status">	                               
	                               		<input type="hidden" id="so_${status.index }" value="${soNm }"/>
	                               	</c:forEach>
	                               	
                            	</td>
                            </tr>
                            </c:if>
                        </table>
                        <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}"> 
                        <script type="text/javascript">
                            var maxFileNum = document.board.posblAtchFileNumber.value;
                            if(maxFileNum==null || maxFileNum==""){
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
                                     <a href="#LINK" onclick="javascript:fn_egov_regist_notice(); return fasle;">저장</a> 
                                  </td>
                                  <td width="10"></td>
           
                              <td>
                                  <a href="#LINK" onclick="javascript:fn_egov_select_noticeList(); return fasle;"><spring:message code="button.list" /></a> 
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
<script>
var login =" ${sessionScope.LoginVO}";

if(login == " "){
	console.log("로그인 안됨");
	location.href="<c:url value='/uat/uia/actionMain.do'/>"
}

 $(document).ready(function(){
	var nmSize="${soNmSize}";
	var listSize="${soListSize}";
	
	 for(var i=0; i<listSize; i++){
		for(var j=0; j<nmSize; j++){
			if($("#soNm_"+i).val() == $("#so_"+j).val()){
				$("#soNm_"+i).attr("checked",true);
			}
		}
	} 
}); 
</script>
</html>

