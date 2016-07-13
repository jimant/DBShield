<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>

//숫자만입력
function onlyNumber(){
	var keycode = window.event.keyCode;
	 
	  if(keycode == 8 || (keycode >= 35 && keycode <= 40) || (keycode >= 46 && keycode <= 57) || (keycode >= 96 && keycode <= 105) || keycode == 110 || keycode == 190) {
	    window.event.returnValue = true;
	    return;
	  } else {
	    window.event.returnValue = false;
	    return;
	  }
}

function keyEncrypt() {

    $.ajax({
        type : "post",
        url : "<c:url value='/keyEncryptTest.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	var data = jQuery.parseJSON(response);
        	
        	var content = "<table class='table table-striped table-bordered table-hover table-condensed'>";
        	content  += "<tr>";
        	content  += "<td>" + "kek 생성" +"<td>";
			content  += "<td>" + "eck 생성" +"<td>";
			content  += "<td>" + "kek 재생성" +"<td>";
			content  += "<td>" + "eck 재생성" +"<td>";
			content  += "<tr>";
			for (var i = 0; i < data.result.length; i++) {
				content  += "<tr>";
				content  += "<td>" + data.result[i].kek +"<td>";
				content  += "<td>" + data.result[i].eck +"<td>";
				content  += "<td>" + data.result[i].remakeKek +"<td>";
				content  += "<td>" + data.result[i].remakeEck +"<td>";
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


$(document).ready(function(){
	
	$("#keyEncrypt").click(function(event) {
		keyEncrypt();
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
						<table class="table table-hover table-condensed">
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th class="al"> 반복횟수</th>
									<td><input type="text"  id="count" name="count" value="2" /></td>
								</tr>
								<tr>
									<th class="al"> key Value</th>
									<td><input type="text"  name="key_value" value="keyValue" /></td>
								</tr>
							</tbody>
						</table>
						<input type="button" class="btn" id="keyEncrypt" value="키생성" />
					</form>
					<div id="dataList"></div>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
