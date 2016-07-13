<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="kr.co.jimant.fo4s.vo.AdminVO"%>
<%
	AdminVO adminVO = (AdminVO) session.getAttribute("SESSION_ADMIN_INFO");
%>

<link rel="stylesheet" type="text/css" href="${_ContextPath}/css/jquery.ptTimeSelect.css" />
<script type="text/javascript" src="${_ContextPath}/js/jquery.ptTimeSelect.js"></script>
<script>

function checkIpForm() {
	var filter = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;

	if (filter.test( $('#work_ip').val()) == true){
		return true;
	} else{
		return false;
	}
}

function register() {
    $.ajax({
        type : "post",
        url : "<c:url value='/workApproveRequest.aj'/>",
        dataType : "html",
        data : $("#workApproveRequestform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("등록완료");
            	document.location.reload();
            } else if (data == "already") {
            	alert("동일 ID 요청이력이 존재합니다.");
            } 
        },
        error : function(xhr, textStatus) {
//         	alert("error");
            
        }
    });
}

$(document).ready(function(){
	
	$("#IP").change(function() {
		if($("#IP option:selected").val()=="localhost"){
			$("#work_ip").val($("#IP option:selected").val());
			$('#work_ip').prop('readonly', true);
		}else if($("#IP option:selected").val()=="Direct"){
			$("#work_ip").val("");
			$('#work_ip').prop('readonly', false);
		}
	});
	
	if($("#start option:selected").val()=="ALL"){
		$("#datepickerStart").val($("#start option:selected").val());
		$('#datepickerStart').prop('disabled', true);
		$('#ptTimeStart').prop('disabled', true);
	}
	if($("#end option:selected").val()=="ALL"){
		$("#datepickerEnd").val($("#end option:selected").val());
		$('#datepickerEnd').prop('disabled', true);
		$('#ptTimeEnd').prop('disabled', true);
	}
	
	$("#start").change(function() {
		if($("#start option:selected").val()=="ALL"){
			$("#datepickerStart").val($("#start option:selected").val());
			$("#ptTimeStart").val("");
			$('#datepickerStart').prop('disabled', true);
			$('#ptTimeStart').prop('disabled', true);
		}else if($("#start option:selected").val()=="Direct"){
			$("#datepickerStart").val("");
			$('#datepickerStart').prop('disabled', false);
			$('#ptTimeStart').prop('disabled', false);
		}
	});
	
	$("#end").change(function() {
		if($("#end option:selected").val()=="ALL"){
			$("#datepickerEnd").val($("#end option:selected").val());
			$("#ptTimeEnd").val("");
			$('#datepickerEnd').prop('disabled', true);
			$('#ptTimeEnd').prop('disabled', true);
		}else if($("#end option:selected").val()=="Direct"){
			$("#datepickerEnd").val("");
			$('#datepickerEnd').prop('disabled', false);
			$('#ptTimeEnd').prop('disabled', false);
		}
	});
	
	$("#register").click(function(event) {
		
		if($("#request_id").val()== ""){
			alert("요청 ID를 입력하세요.");
			return false;	
		} else if($("#work_db_user").val()== ""){
			alert("USER를 입력하세요.");
			return false;	
		} else if($("#IP option:selected").val()=="Direct" && !checkIpForm()){
			alert("ip를 확인하세요");
			return false;	
		}  
		if($("#start option:selected").val()=="Direct" ){
			if($("#datepickerStart").val()=="" || $("#ptTimeStart").val()=="" ){
				alert("시간을 선택하세요.");
				return false;		
			}
		} 
		if($("#end option:selected").val()=="Direct" ){
			if($("#datepickerEnd").val()=="" || $("#ptTimeEnd").val()==""){
				alert("시간을 선택하세요.");
				return false;		
			}
		}
		
		register();	
	});
	
	$(function() {
		  $("#datepickerStart").datepicker();
	});
	$(function() {
		  $("#datepickerEnd").datepicker();
	});
	$(function() {
		  $('#ptTimeStart').ptTimeSelect();
	});
	$(function() {
		  $('#ptTimeEnd').ptTimeSelect();
	});
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>승인요청</H3>
				<form action="./workApproveRequest.aj" method="post" id="workApproveRequestform" name="workApproveRequestform">
					<table class="table table-condensed">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 요청 ID</th>
								<td>
								<input type="text"  id="request_id" name="request_id" value="<%=adminVO.getAdmin_id() %>" readonly="readonly" maxlength="16"/>
								</td>
								
							</tr>
							<tr>
								<th class="al"> DB USER</th>
								<td>
								<input type="text"  id="work_db_user" name="work_db_user" maxlength="30"/>
<!-- 								<select class="ml10" > -->
<!-- 										<option value=""></option> -->
<!-- 										<option value=""></option> -->
<!-- 								</select> -->
								</td>
							</tr>
							<tr>
								<th class="al"> 작업 IP</th>
								<td>
								<input type="text"  id="work_ip" name="work_ip" />
								<select class="ml10" id="IP">
										<option value="Direct">직접입력</option>
										<option value="localhost">localhost</option>
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> 시작 시간</th>
								<td>
								<input type="text" id="datepickerStart" name="datepickerStart" />
							    <input type="text" id="ptTimeStart" name="ptTimeStart" />
								<select class="ml10" id="start" name="start">
										<option value="ALL">ALL</option>
										<option value="Direct">직접입력</option>
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> 종료 시간</th>
								<td>
								<input type="text" id="datepickerEnd" name="datepickerEnd" />
								<input type="text" id="ptTimeEnd" name="ptTimeEnd" />
								<select class="ml10" id="end" name="end">
										<option value="ALL">ALL</option>
										<option value="Direct">직접입력</option>
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> </th>
								<td><input type="button" class="btn" id="register" value="승인요청" /></td>
							</tr>
						</tbody>
					</table>
				</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
