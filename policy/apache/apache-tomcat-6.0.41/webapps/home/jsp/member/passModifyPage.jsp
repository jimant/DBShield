<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>


<script>
var passwordSafety = false;

function passModify() {
	
	 $.ajax({
         type : "post",
         url : "<c:url value='/passModify.aj'/>",
         dataType : "html",
         data : $("#passform").serialize(),
         success : function(data) {
             if (data == "success") {
             	alert("비밀번호 변경완료");
             	location.href = "./myPage.do";
             } else if (data == "fail") {
             	alert("기존 비밀번호가 일치하지 않습니다.");
             } 
         },
         error : function(xhr, textStatus) {
   //      	alert("error");
             
         }
     });
}


$(document).ready(function(){

	$('#passwordInput, #confirmPasswordInput').on('keyup', function(e) {
		 
        if($('#passwordInput').val() == '' && $('#confirmPasswordInput').val() == '')
        {
            $('#passwordStrength').removeClass().html('');
            passwordSafety = false;
            return false;
        }
 
     	if($('#passwordInput').val() != '' && $('#confirmPasswordInput').val() != '' && $('#passwordInput').val() != $('#confirmPasswordInput').val())
    	{
    		$('#passwordStrength').removeClass().addClass('alert alert-error').html('Passwords do not match!');
    		passwordSafety = false;
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
        	passwordSafety = false;
        } else if (strongRegex.test($(this).val())) {
            // If reg ex matches strong password
            $('#passwordStrength').removeClass().addClass('alert alert-success').html('Good Password!');
            passwordSafety = true;
        } else if (mediumRegex.test($(this).val())) {
            // If medium password matches the reg ex
            $('#passwordStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');
            passwordSafety = false;
        } else {
            // If password is ok
            $('#passwordStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');
            passwordSafety = false;
        }
        
        return true;
    });
	
	$("#passModify").click(function(event) {
		if ($("#password").val() == "") {	
			$("#password").focus();
			alert("비밀번호를 입력해 주세요.");
			return false;
		} 
		if(!passwordSafety){
			alert("비밀번호를 확인하세요.");
			return false;
		}
		passModify();
	});
	
	
});
</script>

<!-- container -->
 <div class="jumbotron">
	<div class="container">
	  <h2>비밀번호 변경</h2>
	  <form action="./passModify.aj"	enctype="multipart/form-data" method="post" id="passform" name="passform">
		  <table class="table  table-hover ">
				<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th > 기존 비밀번호</th>
									<td><input type="text" maxlength="16" id="password" name="password" /></td>
								</tr>
								<tr>
									<th > 새로운 비밀번호</th>
									<td><input type="password" id="passwordInput"  name="new_password" maxlength="16" /><div class="" id="passwordStrength"></div></td>
								</tr>
								<tr>
									<th > 비밀번호 재입력</th>
									<td><input type="password" id="confirmPasswordInput" maxlength="16" /></td>
								</tr>
								<tr>
									<th></th>
									<td><input type="button" class="btn  " id="passModify" value="비밀번호변경" /></td>
								</tr>
					
				</tbody>
			</table>
	</form>
    </div>
</div>

<!-- //container -->
