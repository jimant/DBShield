<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>


<script>
var passwordSafety = false;

function findPassword() {
	
	 $.ajax({
         type : "post",
         url : "<c:url value='/findPassword.aj'/>",
         dataType : "html",
         data : $("#findform").serialize(),
         success : function(data) {
             if (data == "success") {
             	alert("메일발송완료");
             	location.href = "./mainPage.do";
             } else if (data == "fail") {
             	alert("아이디를 혹은 이메일을 잘못 입력하였습니다.");
             } 
         },
         error : function(xhr, textStatus) {
    //     	alert("error");
             
         }
     });
}

function checkEmail(emailValue){  
	var regType = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	if (regType.test(emailValue)) { 
		return true;
	} else{
		return false;
	}
}

$(document).ready(function(){
	
	$("#find").click(function(event) {
		if ($("#member_id").val() == "") {	
			$("#member_id").focus();
			alert("아이디 입력해 주세요.");
			return false;
		} 
		if (!checkEmail($("#email").val())) {
			alert("이메일이 올바르지 않습니다.");
			$("#email").focus();
			return false;
		}
		findPassword();
	});
	
	
});
</script>

<!-- container -->
 <div class="jumbotron">
	<div class="container">
	  <h2>비밀번호 찾기</h2>
	  <p><b>이메일로 임시 비밀번호를 발송합니다. 아이디와 가입당시 등록한 이메일 입력하세요.</b></p>
	  <form action="./passModify.aj"	enctype="multipart/form-data" method="post" id="findform" name="findform">
		  <table class="table  table-hover ">
				<colgroup>
							<col width="15%" />
							<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<th > 아이디</th>
									<td><input type="text" maxlength="16" id="member_id" name="member_id" /></td>
								</tr>
								<tr>
									<th > 이메일</th>
									<td><input type="text" id="email" name="email" /></td>
								</tr>
								<tr>
									<th></th>
									<td><input type="button" class="btn btn-primary " id="find" value="메일발송" /></td>
								</tr>
					
				</tbody>
			</table>
	</form>
    </div>
</div>

<!-- //container -->
