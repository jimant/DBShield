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
        url : "<c:url value='/eckRemake.aj'/>",
        dataType : "html",
        data : $("#eckMakeform").serialize(),
        success : function(data) {
        	if (data == "fail") {
        		alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
            } else if (data == "permission") {
            	alert("권한이 업습니다.");
            } else if (data == "nothing") {
        		alert("암호키가 없습니다. 먼저 생성해야 합니다.");
        	}else if (data == "success") {
            	alert("암호키가 재생성 되었습니다. 새로운 암호키를 시스템에 적용하려면 반드시 키, 정책 upload를 재실행{stopstart}하여 주세요");
            } 
        },
        error : function(xhr, textStatus) {
        	alert($("#eckMakeform").serialize());
            
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
			
		</div>
		<div class="span8">
				<form action="./eckRemake.aj" method="post" id="eckMakeform" name="eckMakeform">
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
								<td><input type="password"  name="password" /></td>
							</tr>
							<tr>
								<th class="al"> </th>
								<td><input type="button" class="btn" id="register" value="재생성" /></td>
							</tr>
						</tbody>
					</table>
				</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
