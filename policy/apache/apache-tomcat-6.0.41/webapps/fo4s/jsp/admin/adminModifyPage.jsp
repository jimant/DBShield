<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="kr.co.jimant.fo4s.vo.AdminVO"%>
<%
	AdminVO adminVO = (AdminVO) request.getAttribute("adminVO");
%>
<script>

function modify() {
	
    $.ajax({
        type : "post",
        url : "<c:url value='/adminModify.aj'/>",
        dataType : "html",
        data : $("#adminModifyform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("수정완료");
            	location.href = "./adminViewPage.do";
            } 
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}

$(document).ready(function(){
	
	var permission = "<%=adminVO.getPermission()%>";
	if (permission == "S") {
		$("#permission").val("S").attr("selected", "selected");
	}else {
		$("#permission").val("N").attr("selected", "selected");
	}
	
	$("#modify").click(function(event) {
		modify();
	});
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>관리자 정보수정</H3>
				<form action="./adminModify.aj" method="post" id="adminModifyform" name="adminModifyform">
					<table class="table table-condensed">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 관리자 아이디</th>
								<td><input type="text" class="med gray" name="admin_id" value="<%=adminVO.getAdmin_id() %>" readonly="readonly" /></td>
							</tr>
							<tr>
								<th class="al"> 관리자 비밀번호</th>
								<td><input type="password" class="med gray" name="password" value="<%=adminVO.getPassword() %>"  maxlength="16" /></td>
							</tr>
							<tr>
								<th class="al"> 관리자 이름</th>
								<td><input type="text" class="med gray" name="name" value="<%=adminVO.getName() %>" maxlength="10" /></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th class="al"> 관리자 권한</th> -->
<!-- 								<td> -->
<!-- 									<select class="ml10" name="permission" id="permission" > -->
						
<!-- 										<option value="S">보안관리자</option> -->
<!-- 										<option value="N">일반관리자</option> -->
<!-- 									</select> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<th class="al"> </th>
								<td><input type="button" id="modify" value="수정" /></td>
							</tr>
						</tbody>
					</table>
				</form>	
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
