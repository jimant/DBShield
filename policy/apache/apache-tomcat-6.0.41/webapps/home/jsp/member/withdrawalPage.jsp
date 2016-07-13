<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>


<script>

function withdrawal() {
	if (confirm("탈퇴 하시겠습니까?")) {
		 $.ajax({
	         type : "post",
	         url : "<c:url value='/withdrawal.aj'/>",
	         dataType : "html",
	         data : $("#withdrawalform").serialize(),
	         success : function(data) {
	             if (data == "success") {
	             	alert("탈퇴가 완료되었습니다. 그동안 이용해 주셔서 감사합니다.");
	             	location.href = "./mainPage.do";
	             } else if (data == "fail") {
	             	alert("비밀번호가 일치하지 않습니다.");
	             } 
	         },
	         error : function(xhr, textStatus) {
	//         	alert("error");
	             
	         }
	     });
	} else {
	}	 
}


$(document).ready(function(){
	
	$("#withdrawal").click(function(event) {
		if ($("#password").val() == "") {	
			$("#password").focus();
			alert("비밀번호를 입력해 주세요.");
			return false;
		} 
		withdrawal()
	});
	
	
});
</script>

<!-- container -->
 <div class="jumbotron">
	<div class="container">
	  <h2>회원탈퇴</h2>
	  <form action="./withdrawal.aj"	enctype="multipart/form-data" method="post" id="withdrawalform" name="withdrawalform">
		  <table class="table  table-hover ">
				<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th > 비밀번호</th>
									<td><input type="text" maxlength="16" id="password" name="password" /></td>
								</tr>
								<tr>
									<th></th>
									<td><input type="button" class="btn  " id="withdrawal" value="회원탈퇴" /></td>
								</tr>
					
				</tbody>
			</table>
	</form>
    </div>
</div>

<!-- //container -->
