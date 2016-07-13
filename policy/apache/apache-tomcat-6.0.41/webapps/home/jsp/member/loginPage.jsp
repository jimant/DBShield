<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>

function login() {
	
    $.ajax({
        type : "post",
        url : "<c:url value='/login.aj'/>",
        dataType : "html",
        data : $("#loginform").serialize(),
        success : function(data) {
            if (data == "success") {
            	location.href = "./mainPage.do";
            } else if (data == "certify") {
            	alert("이메일 인증이 필요합니다.");
            } else if (data == "fail") {
            	alert("아이디 혹은 비밀번호를 잘못 입력하였습니다.");
            } 
        },
        error : function(xhr, textStatus) {
        	login();
        }
    });
}

$(document).ready(function(){
	
	$("#loginButton").click(function(event) {
		if ( $("#member_id").val() == "" ) {
			alert("아이디를 입력하세요.");
			$("#member_id").focus();
		} else if( $("#password").val() == "" ){
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
		} else {
			login();
		}
	});
	
	$("#password").keyup(function(e) {
        if (e.keyCode == 13 && $("#member_id").val() != "" && $("#password").val() != "") {
        	login();
        }
    });
});
</script>

<!-- container -->
 <div class="jumbotron">
	<div class="container">

      <form class="form-signin" role="form" id="loginform" name="loginform" >
        <h2 class="form-signin-heading">로그인</h2>
        <input type="text" class="form-control" placeholder="ID" id="member_id" name="member_id" required autofocus>
        <input type="password" class="form-control" placeholder="Password" id="password" name="password" required>
<!--         <label class="checkbox"> -->
<!--           <input type="checkbox" value="remember-me"> Remember me -->
<!--         </label> -->
        <input type="button" class="btn btn-lg btn-primary btn-block" id="loginButton" value="로그인" />
<!--         <button class="btn btn-lg btn-primary btn-block" type="submit" id="loginButton" >Sign in</button> type="submit" 이코드  때문에 ajax 에러발생 -->
      </form>

    </div>
</div>

<!-- //container -->
