<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<script>

function checkIpForm() {
	var filter = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;

	if (filter.test( $('#connect_ip').val()) == true){
		return true;
	} else{
		return false;
	}
}

function register() {
    $.ajax({
        type : "post",
        url : "<c:url value='/behaviorAC.aj'/>",
        dataType : "html",
        data : $("#behaviorACform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("정책을 암호화 시스템에 적용하기 위해서는 키/정책 업로더 stop한 후 다시 start하여야 합니다.");
            } 
        },
        error : function(xhr, textStatus) {
        	alert($("#behaviorACform").serialize());
            
        }
    });
}

$(document).ready(function(){
	
	if($("#IP option:selected").val()=="ALL"){
		$("#connect_ip").val($("#IP option:selected").val());
		$('#connect_ip').prop('readonly', true);
	}
	
	$("#IP").change(function() {
		if($("#IP option:selected").val()=="ALL"){
			$("#connect_ip").val($("#IP option:selected").val());
			$('#connect_ip').prop('readonly', true);
		}else if($("#IP option:selected").val()=="Direct"){
			$("#connect_ip").val("");
			$('#connect_ip').prop('readonly', false);
		}
	});
	
	
	$("#register").click(function(event) {
		if($("#IP option:selected").val()=="ALL"){
			register();		
		}else{
			if(checkIpForm()){
				register();		
			}else{
				alert("ip를 확인하세요");
			}	
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
				<form action="./behaviorAC.aj" method="post" id="behaviorACform" name="behaviorACform">
					<table class="table table-condensed">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 접속 IP</th>
								<td>
								<input type="text"  id="connect_ip" name="connect_ip" />
								<select class="ml10" id="IP">
										<option value="ALL">ALL</option>
										<option value="Direct">직접입력</option>
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> DB USER</th>
								<td>
								<input type="text"  name="connect_db_user" />
<!-- 								<select class="ml10" > -->
<!-- 										<option value=""></option> -->
<!-- 										<option value=""></option> -->
<!-- 								</select> -->
								</td>
							</tr>
							<tr>
								<th class="al"> 짧은 시간(분 단위)</th>
								<td><input type="text"  name="small_time" /></td>
							</tr>
							<tr>
								<th class="al"> 짧은 시간 횟수</th>
								<td><input type="text"  name="small_time_count" /></td>
							</tr>
							<tr>
								<th class="al"> 긴 시간(분 단위)</th>
								<td><input type="text"  name="big_time" /></td>
							</tr>
							<tr>
								<th class="al"> 긴 시간 횟수</th>
								<td><input type="text" name="big_time_count" /></td>
							</tr>
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
