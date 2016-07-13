<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>


function register() {
	
    $.ajax({
        type : "post",
        url : "<c:url value='/adminAdd.aj'/>",
        dataType : "html",
        data : $("#adminAddform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("등록완료");
            	document.location.reload();
            } else if (data == "already") {
            	alert("아이디가 이미 존재합니다.");
            } 
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}

$(document).ready(function(){
	
	$("#register").click(function(event) {
		register();
	});
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
<!-- 			<div class="well sidebar-nav"> -->
<!-- 				<ul class="nav nav-list"> -->
							
<!-- 					<li><a href="./adminAddPage.do"><h1>관리자등록</h1></a></li> -->
<!-- 					<li><a href="./adminViewPage.do"><h1>관리자목록</h1></a></li>			 -->
<!-- 					<li><a href="./globalPolicyPage.do"><h1>글로벌암호정책설정</h1></a></li> -->
<!-- 					<li><a href="./columnPolicyConnect.do"><h1>컬럼별암호정책설정</h1></a></li> -->
<!-- 					<li><a href="./columnPolicyView.do"><h1>컬럼별암호정책목록</h1></a></li> -->
<!-- 					<li><a href="./kekMakePage.do"><h1>키암호키생성</h1></a></li> -->
<!-- 					<li><a href="./eckMakePage.do"><h1>암호키생성</h1></a></li> -->
<!-- 					<li><a href="./eckRemakePage.do"><h1>암호키재생성</h1></a></li> -->
<!-- 					<li><a href="./policyACPage.do"><h1>정책기반접근제어</h1></a></li> -->
<!-- 					<li><a href="./policyACViewPage.do"><h1>정책기반접근제어목록</h1></a></li> -->
<!-- 					<li><a href="./behaviorACPage.do"><h1>행위기반접근제어</h1></a></li> -->
<!-- 					<li><a href="./behaviorACViewPage.do"><h1>행위기반접근제어목록</h1></a></li> -->
<!-- 					<li><a href="./workApproveRequestPage.do"><h1>작업승인요청</h1></a></li> -->
<!-- 					<li><a href="./workApproveCancelPage.do"><h1>작업승인취소</h1></a></li> -->
<!-- 					<li><a href="./workApprovePage.do"><h1>작업승인</h1></a></li> -->
<!-- 					<li><a href="./previewPage.do"><h1>previewPage</h1></a></li> -->
					

<!-- 				</ul> -->
<!-- 			</div> -->
		</div>
		<div class="span8">
		<H3>관리자 등록</H3>
				<form action="./adminAdd.aj" method="post" id="adminAddform" name="adminAddform">
					<table class="table table-condensed">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 관리자 아이디</th>
								<td><input type="text" name="admin_id" maxlength="16"/></td>
							</tr>
							<tr>
								<th class="al"> 관리자 비밀번호</th>
								<td><input type="password" name="password" maxlength="16"/></td>
							</tr>
							<tr>
								<th class="al"> 관리자 이름</th>
								<td><input type="text" name="name" maxlength="10"/></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th class="al"> 관리자 권한</th> -->
<!-- 								<td> -->
<!-- 									<select class="ml10" name="permission" id="permission"> -->
						
<!-- 										<option value="S">보안관리자</option> -->
<!-- 										<option value="N">일반관리자</option> -->
<!-- 									</select> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<th class="al"> </th>
								<td><input type="button" class="btn" id="register" value="등록" /></td>
							</tr>
						</tbody>
					</table>
				</form>	
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
