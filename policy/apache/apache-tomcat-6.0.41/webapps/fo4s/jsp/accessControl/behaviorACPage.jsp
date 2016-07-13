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
            	document.location.reload();
            } 
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}

$(document).ready(function(){
	
	$("#small_time, #small_time_count, #big_time, #big_time_count").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		}
	});
	
	if($("#IP option:selected").val()=="ALL"){
		$("#connect_ip").val($("#IP option:selected").val());
		$('#connect_ip').prop('readonly', true);
	}
	
	$("#IP").change(function() {
		if($("#IP option:selected").val()=="ALL"){
			$("#connect_ip").val($("#IP option:selected").val());
			$('#connect_ip').prop('readonly', true);
		}else if($("#IP option:selected").val()=="localhost"){
			$("#connect_ip").val($("#IP option:selected").val());
			$('#connect_ip').prop('readonly', true);
		}else if($("#IP option:selected").val()=="Direct"){
			$("#connect_ip").val("");
			$('#connect_ip').prop('readonly', false);
		}
	});
	
	
	$("#register").click(function(event) {
		
		if($("#IP option:selected").val()=="Direct" && !checkIpForm()){
			alert("ip를 확인하세요");
			return false;	
		} else if($("#connect_db_user").val()== ""){
			alert("USER를 입력하세요.");
			return false;	
		} else if($("#small_time").val()== ""){
			alert("짧은 시간을 입력하세요.");
			return false;	
		} else if($("#small_time_count").val()== ""){
			alert("짧은 시간 횟수를 입력하세요.");
			return false;	
		} else if($("#big_time").val()== ""){
			alert("긴 시간을 입력하세요.");
			return false;	
		} else if($("#big_time_count").val()== ""){
			alert("긴 시간 홧수를 입력하세요.");
			return false;	
		}
		
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
		<H3>행위기반 접근제어 등록</H3>
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
										<option value="localhost">localhost</option>
										<option value="Direct">직접입력</option>
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> DB USER</th>
								<td>
								<input type="text"  id="connect_db_user" name="connect_db_user" maxlength="30"/>
<!-- 								<select class="ml10" > -->
<!-- 										<option value=""></option> -->
<!-- 										<option value=""></option> -->
<!-- 								</select> -->
								</td>
							</tr>
							<tr>
								<th class="al"> 짧은 시간(분 단위)</th>
								<td><input type="text"  id="small_time" name="small_time" maxlength="14" />&nbsp; ex) 0005: 5분</td>
							</tr>
							<tr>
								<th class="al"> 짧은 시간 횟수</th>
								<td><input type="text"  id="small_time_count" name="small_time_count" maxlength="4" /></td>
							</tr>
							<tr>
								<th class="al"> 긴 시간(분 단위)</th>
								<td><input type="text"  id="big_time" name="big_time" maxlength="14" />&nbsp; ex) 2400: 24시간</td>
							</tr>
							<tr>
								<th class="al"> 긴 시간 횟수</th>
								<td><input type="text" id="big_time_count" name="big_time_count" maxlength="6" /></td>
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
