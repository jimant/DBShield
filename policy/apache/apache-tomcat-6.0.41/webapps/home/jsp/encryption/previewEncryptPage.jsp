<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.encryption.PreviewConnectionVO"%>

<%
	ArrayList<String> list = (ArrayList) request.getAttribute("list");

	PreviewConnectionVO connectionVO = (PreviewConnectionVO) request.getAttribute("connectionVO");
%>

<script>

function columnView() {
	 
    $.ajax({
        type : "post",
        url : "<c:url value='/previewColumnView.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	var data = jQuery.parseJSON(response);
        	var str = "";
        	
        	for (var i = 0; i < data.result.length; i++) {
        		
        			str += "<option value='" + data.result[i].columnName + "' >" + data.result[i].columnName + "</option>";
        	}
        	$("#selectColumn").html(str);
			
        },
        error : function(xhr, textStatus) {
        	alert($("#sendform").serialize());
            
        }
    });
}

function dataView() {

    $.ajax({
        type : "post",
        url : "<c:url value='/dataView.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	var data = jQuery.parseJSON(response);
        	
        	var content = "<table>";
        	
			for (var i = 0; i < data.result.length; i++) {
				content  += "<tr>";
				content  += "<td>" + data.result[i].columnName +"<td>";
				content  += "<tr>";
			}
			content += "<table>";
        	$("#dataList").html(content);
        },
        error : function(xhr, textStatus) {
        	alert($("#sendform").serialize());
            
        }
    });
}
function selectAll() {

    $.ajax({
        type : "post",
        url : "<c:url value='/selectAll.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	var data = jQuery.parseJSON(response);
        	
        	var content = "<table class='table table-striped table-bordered table-hover table-condensed'>";
        	content  += "<tr>";
        	content  += "<td>" + "MEMBER_NO" +"<td>";
			content  += "<td>" + "MEMBER_ID" +"<td>";
			content  += "<td>" + "PASSWORD" +"<td>";
			content  += "<tr>";
			for (var i = 0; i < data.result.length; i++) {
				content  += "<tr>";
				content  += "<td>" + data.result[i].member_no +"<td>";
				content  += "<td>" + data.result[i].member_id +"<td>";
				content  += "<td>" + data.result[i].password +"<td>";
				content  += "<tr>";
			}
			content += "<table>";
        	$("#dataList").html(content);
        },
        error : function(xhr, textStatus) {
        	alert($("#sendform").serialize());
            
        }
    });
}

function encryption() {

    $.ajax({
        type : "post",
        url : "<c:url value='/encryption.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	if(response == "fail"){
        		alert("fail");
        	}else{
        		alert("success");
        	}
//         	var data = jQuery.parseJSON(response);
			
// 			var content = "<table>";
// 			for (var i = 0; i < data.result.length; i++) {
// 				content  += "<tr>";
// 				content  += "<td>" + data.result[i].columnName +"<td>";
// 				content  += "<tr>";
// 			}
// 			content += "<table>";
//         	$("#dataList").html(content);
        },
        error : function(xhr, textStatus) {
        	alert($("#dataList").serialize());
            
        }
    });
}

function decryption() {

    $.ajax({
        type : "post",
        url : "<c:url value='/decryption.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	if(response == "fail"){
        		alert("fail");
        	}else{
        		alert("success");
        	}
//         	var data = jQuery.parseJSON(response);
			
// 			var content = "<table>";
// 			for (var i = 0; i < data.result.length; i++) {
// 				content  += "<tr>";
// 				content  += "<td>" + data.result[i].columnName +"<td>";
// 				content  += "<tr>";
// 			}
// 			content += "<table>";
//         	$("#dataList").html(content);
        },
        error : function(xhr, textStatus) {
        	alert($("#dataList").serialize());
            
        }
    });
}

$(document).ready(function(){
 	columnView();
	
	$("#selectTable").change(function() {
		columnView();
	});
	
	$("#dataView").click(function(event) {
		dataView();
	});
	
	$("#selectAll").click(function(event) {
		selectAll();
	});
	
	$("#encryption").click(function(event) {
		if($("#selectColumn option:selected").val()=="MEMBER_ID"){
			$("#selectMethod").val("M");
			encryption();
		}else if($("#selectColumn option:selected").val()=="PASSWORD"){
			$("#selectMethod").val("P");
			encryption();
		}else{
			alert("Primary key 는  암복호화 할 수 없습니다.");
		}
	});
	
	$("#decryption").click(function(event) {
		if($("#selectColumn option:selected").val()=="MEMBER_ID"){
			$("#selectMethod").val("M");
			decryption();
		}else if($("#selectColumn option:selected").val()=="PASSWORD"){
			$("#selectMethod").val("P");
			decryption();
		}else{
			alert("Primary key 는  암복호화 할 수 없습니다.");
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
					<form method="post" id="sendform" name="sendform">
					<input type="hidden" name="selectDB" value="<%=connectionVO.getSelectDB() %>" />
					<input type="hidden" name="host" value="<%=connectionVO.getHost() %>" />
					<input type="hidden" name="user" value="<%=connectionVO.getUser() %>" />
					<input type="hidden" name="password" value="<%=connectionVO.getPassword() %>" />
					<input type="hidden" name="database" value="<%=connectionVO.getDatabase() %>" />
					<input type="hidden" name="port" value="<%=connectionVO.getPort() %>" />
					<input type="hidden" id="selectMethod" name="selectMethod" value="" />
						<table summary="신청 상세 내역 영역입니다." class="basic" >
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th class="al"> 테이블 이름</th>
									<td>
									<input type="text" />
									<select class="ml10" id="selectTable" name="table_name">
								<%for (int i = 0; i < list.size(); i++) {String tableName = (String) list.get(i);%>
									<option value="<%=tableName %>"><%=tableName %></option>
								<%}%>
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> 컬럼 이름</th>
									<td>
									<input type="text"  />
									<select class="ml10" id="selectColumn" name="column_name">
						
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
									</select>
<!-- 									<input type="button" id="dataView" value="조회" style="vertical-align: 20%"/> -->
									</td>
								</tr>
								</tbody>
						</table>
						<input type="button" class="btn" id="selectAll" value="조회" />
						<input type="button" class="btn" id="encryption" value="암호화" />
						<input type="button" class="btn" id="decryption" value="복호화" />
					</form>
					<div id="dataList"></div>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
