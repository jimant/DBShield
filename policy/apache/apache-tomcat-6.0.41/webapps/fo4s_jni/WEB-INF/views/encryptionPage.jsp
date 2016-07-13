<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>
<head>
	<title>JIMANT</title>
	
	<!-- Include bootstrap stylesheets -->
    	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
		<!-- JavaScript placed at the end of the document so the pages load faster -->
	    <!-- Optional: Include the jQuery library -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	    <!-- Optional: Incorporate the Bootstrap JavaScript plugins -->
	    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	
</head>
<body>
<script type="text/javascript">
function encryption() {
    $.ajax({
        type : "post",
        url : "<c:url value='/encryption.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	var data = jQuery.parseJSON(response);
        	
        	var content = "<table class='table'>";
        	content  += "<tr>";
        	content  += "<td>" + "encryptionData : " + "<b>" + data.encryptionData + "<b>" + "</td>";
			content  += "</tr>";
			content += "</table>";
			
        	$("#cryptData").html(content);
        },
        error : function(xhr, textStatus) {
//        	alert($("#sendform").serialize());
        	alert("입력정보가 올바르지 않습니다. DB연결정보가 올바른지 또는 정책에 맞는 정보로 입력하였는지 확인바랍니다.");
            
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
        	var data = jQuery.parseJSON(response);
        	
        	var content = "<table class='table'>";
        	content  += "<tr>";
        	content  += "<td>" + "decryptionData : " + "<b>" + data.decryptionData + "<b>" + "</td>";
			content  += "</tr>";
			content += "</table>";
			
        	$("#cryptData").html(content);
        },
        error : function(xhr, textStatus) {
//        	alert($("#sendform").serialize());
        	alert("입력정보가 올바르지 않습니다. DB연결정보가 올바른지 또는 정책에 맞는 정보로 입력하였는지 확인바랍니다.");
        }
    });
}



$(document).ready(function(){
	
	$("#encryption").click(function(event) {
		encryption();
	});
	$("#decryption").click(function(event) {
		decryption();
	});
});
</script>
				<form method="post" id="sendform" name="sendform">
					<table class="table ">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th > DB type</th>
								<td>
									
									<select  name="dbType">
											<option value="M">MySQL</option>
											<option value="O">Oracle</option>
									</select>
								</td>
							</tr>
							<tr>
								<th > Host</th>
								<td><input type="text"  name="host" value="localhost"/></td>
							</tr>
							<tr>
								<th > User</th>
								<td><input type="text"  name="dbUser" value="root"/></td>
							</tr>
							<tr>
								<th > Password</th>
								<td><input type="password"  name="password" value="hitcom123"/></td>
							</tr>
							<tr>
								<th > Port</th>
								<td><input type="text"  name="port" value="3306"/></td>
							</tr>
							<tr>
								<th > DB 이름</th>
								<td><input type="text"  name="dbName" value="CUSTOM_DB"/></td>
							</tr>
							<tr>
								<th > 테이블 이름</th>
								<td><input type="text"  name="tableName" value="MEMBER"/></td>
							</tr>
							<tr>
								<th > 컬럼 이름</th>
								<td><input type="text"  name="columnName" value="MEMBER_ID"/></td>
							</tr>
							<tr>
								<th > 암복호화할 데이터</th>
								<td><input type="text"  name="data" value="dataValue"/></td>
							</tr>
						</tbody>
					</table>
				</form>
				<input type="button" class="btn" id="encryption" value="암호화" /> &nbsp; <input type="button" class="btn" id="decryption" value="복호화" />
				<div id="cryptData"></div>
	</body>
</html>
