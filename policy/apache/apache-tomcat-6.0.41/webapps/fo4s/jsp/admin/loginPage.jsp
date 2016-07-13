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
            if (data == "super") {
            	location.href = "./globalPolicyView.do";
            } else if (data == "general") {
            	location.href = "./workApproveRequestPage.do";
            } else if (data == "fail") {
            	alert("아이디 혹은 비밀번호를 잘못 입력하였습니다.");
            } 
        },
        error : function(xhr, textStatus) {
     		login();
        }	

//  		 error : function(x, e) {
                
//  			    if(x.status==0){

//                 alert('You are offline!!n Please Check Your Network.');

//                 }else if(x.status==404){

//                 alert('Requested URL not found.');

//                 }else if(x.status==500){

//                 alert('Internel Server Error.');

//                 }else if(e=='parsererror'){

//                 alert('Error.nParsing JSON Request failed.');

//                 }else if(e=='timeout'){

//                 alert('Request Time out.');

//                 }else {

//                 alert('Unknow Error.n'+x.responseText);

//                 }
            
//       	}
    });
}

$(document).ready(function(){
	
	$("#loginButton").click(function(event) {
		login();
	});
	$("#password").keyup(function(e) {
        if (e.keyCode == 13 && $("#password").val() != "") {
        	login();
        }
    });
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
				<form action="./login.aj" method="post" id="loginform" name="loginform">
					<table class="table table-condensed">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 아이디</th>
								<td><input type="text" name="admin_id" maxlength="16"/></td>
							</tr>
							<tr>
								<th class="al"> 비밀번호</th>
								<td><input type="password" id="password" name="password" maxlength="16"/></td>
							</tr>
							<tr>
								<th class="al"> </th>
								<td><input type="button" class ="btn" id="loginButton" value="로그인" /></td>
							</tr>
						</tbody>
					</table>
				</form>	
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
