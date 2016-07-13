<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>

var passwordSafety = 0;

function register() {
    $.ajax({
        type : "post",
        url : "<c:url value='/eckMake.aj'/>",
        dataType : "html",
        data : $("#eckMakeform").serialize(),
        success : function(data) {
        	if (data == "fail") {
        		alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
            } else if (data == "permission") {
            	alert("권한이 업습니다.");
            } else if (data == "already.") {
            	alert("암호키가 이미 존재합니다.");
            } else if (data == "success") {
            	alert("암호키가 생성 되었습니다.");
            } 
        },
        error : function(xhr, textStatus) {
        	alert($("#eckMakeform").serialize());
            
        }
    });
}

$(document).ready(function(){
	
	$("#register").click(function(event) {
		if(passwordSafety == 0){
			alert("키값을 확인하세요");	
		}else{
			register();		
		}
	});
	
	$('#passwordInput, #confirmPasswordInput').on('keyup', function(e) {
		 
	     if($('#passwordInput').val() == '' && $('#confirmPasswordInput').val() == '')
	     {
	         $('#passwordStrength').removeClass().html('');
	         passwordSafety = 0;
	         return false;
	     }
	
	  	if($('#passwordInput').val() != '' && $('#confirmPasswordInput').val() != '' && $('#passwordInput').val() != $('#confirmPasswordInput').val())
	 		{
	 		$('#passwordStrength').removeClass().addClass('alert alert-error').html('Passwords do not match!');
	  		passwordSafety = 0;
	      	return false;
	 		}
	
	     // Must have capital letter, numbers and lowercase letters
	     var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
	
	     // Must have either capitals and lowercase letters or lowercase and numbers
	     var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
	
	     // Must be at least 6 characters long
	     var okRegex = new RegExp("(?=.{6,}).*", "g");
	
	     if (okRegex.test($(this).val()) === false) {
	         // If ok regex doesn't match the password
	     	$('#passwordStrength').removeClass().addClass('alert alert-error').html('Password must be 6 characters long.');
	     	passwordSafety = 0;
	     } else if (strongRegex.test($(this).val())) {
	         // If reg ex matches strong password
	         $('#passwordStrength').removeClass().addClass('alert alert-success').html('Good Password!');
	         passwordSafety = 1;
	     } else if (mediumRegex.test($(this).val())) {
	         // If medium password matches the reg ex
	         $('#passwordStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');
	         passwordSafety = 0;
	     } else {
	         // If password is ok
	         $('#passwordStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');
	         passwordSafety = 0;
	     }
	     
	     return true;
	});
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
				<form action="./eckMake.aj" method="post" id="eckMakeform" name="eckMakeform">
					<table class="table table-condensed">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 관리자 ID</th>
								<td><input type="text" name="admin_id" /></td>
							</tr>
							<tr>
								<th class="al"> 관리자 비밀번호</th>
								<td><input type="password" name="password" /></td>
							</tr>
							<tr>
								<th class="al"> 암호키 입력</th>
								<td><input type="password" id="passwordInput" name="encrypt_key" /><div class="" id="passwordStrength"></div></td>
							</tr>
							<tr>
								<th class="al"> 암호키 재입력</th>
								<td><input type="password"  id="confirmPasswordInput" /></td>
							</tr>
							<tr>
								<th class="al"> </th>
								<td><input type="button"  class="btn" id="register" value="생성"/></td>
							</tr>
							
						</tbody>
					</table>
				</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
