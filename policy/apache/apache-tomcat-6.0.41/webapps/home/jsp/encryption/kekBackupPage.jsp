<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>


function backup() {
	
    $.ajax({
        type : "post",
        url : "<c:url value='/kekBackup.aj'/>",
        dataType : "html",
        data : $("#informationform").serialize(),
        success : function(response) {
        	if (response == "fail") {
        		alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
            } else if (response == "permission") {
            	alert("권한이 업습니다.");
            } else if (response == "nothing") {
            	alert("키암호키가 존재하지 않습니다.");
            } else {
            	var data = jQuery.parseJSON(response);
            	alert("키암호키 백업완료!\n"+"파일경로: "+data.result[0].KEY_PATH+"\n파일명: "+data.result[1].KEK_FILE_NAME);
            }
        },
        error : function(xhr, textStatus) {
        	alert($("#informationform").serialize());
            
        }
    });
}

function restore() {
	
    $.ajax({
        type : "post",
        url : "<c:url value='/kekRestore.aj'/>",
        dataType : "html",
        data : $("#informationform").serialize(),
        success : function(response) {
        	if (response == "fail") {
        		alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
            } else if (response == "permission") {
            	alert("권한이 업습니다.");
            } else if (response == "nothing") {
            	alert("키암호키가 존재하지 않습니다.");
            } else if (response == "nofile") {
            	alert("백업파일이 존재하지 않습니다.");
            } else {
            	var data = jQuery.parseJSON(response);
            	alert("키암호키 복구완료!\n"+"파일경로: "+data.result[0].KEY_PATH+"\n파일명: "+data.result[1].KEK_FILE_NAME);
            }
        },
        error : function(xhr, textStatus) {
        	alert($("#informationform").serialize());
            
        }
    });
}

$(document).ready(function(){
	
	$("#backup").click(function(event) {
		backup();
	});
	
	$("#restore").click(function(event) {
		restore();
	});
	
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
				<form  method="post" id="informationform" name="informationform">
					<table class="table table-condensed">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 아이디</th>
								<td><input type="text" name="admin_id" /></td>
							</tr>
							<tr>
								<th class="al"> 비밀번호</th>
								<td><input type="password" id="password" name="password" /></td>
							</tr>
							<tr>
								<th class="al"> </th>
								<td><input type="button" class ="btn" id="backup" value="백업" />&nbsp;&nbsp;<input type="button" class ="btn" id="restore" value="복구" /></td>
							</tr>
						</tbody>
					</table>
				</form>	
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
