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

function dataEncrypt() {
	jQuery('#dataDecrypt').show();  
    $.ajax({
        type : "post",
        url : "<c:url value='/dataEncrypt.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	var data = jQuery.parseJSON(response);
//         	$("#encryptionData").val(data.encryptionData);
        	
        	var content = "<table class='table'>";
        	content  += "<tr>";
        	content  += "<td>" + "encryptionData : " + "<b>" + data.encryptionData + "<b>" + "</td>";
			content  += "</tr>";
			content += "</table>";
			
        	$("#cryptData").html(content);
        },
        error : function(xhr, textStatus) {
        	alert($("#sendform").serialize());
            
        }
    });
}

function dataDecrypt() {

    $.ajax({
        type : "post",
        url : "<c:url value='/dataDecrypt.aj'/>",
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
        	alert($("#sendform").serialize());
            
        }
    });
}

function SHA() {
	jQuery('#dataDecrypt').hide();  
    $.ajax({
        type : "post",
        url : "<c:url value='/SHA.aj'/>",
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
        	alert($("#sendform").serialize());
            
        }
    });
}




$(document).ready(function(){
	//ECB 모드에서 iv 사용불가 코드
	if($("#operate_mode option:selected").val() == "ECB"){
		//체크박스 체크불가
		$('#ivCheck').prop('disabled', true);
		
		//체크박스 선택해제
		$("input[id=ivCheck]:checkbox").prop("checked", false);
		
		//text value값 초기화
		$("#iv_value").val("");
		
		//text value readonly true
		$('#iv_value').prop('readonly', true);
	}else if($("#operate_mode option:selected").val() == "CBC"){
		$('#ivCheck').prop('disabled', false);
	}
	
	//ECB 모드에서 iv 사용불가 코드
	$("#operate_mode").click(function(event) {
		if($("#operate_mode option:selected").val() == "ECB"){
			//체크박스 체크불가
			$('#ivCheck').prop('disabled', true);
			
			//체크박스 선택해제
			$("input[id=ivCheck]:checkbox").prop("checked", false);
			
			//text value값 초기화
			$("#iv_value").val("");
			
			//text value readonly true
			$('#iv_value').prop('readonly', true);
		}else if($("#operate_mode option:selected").val() == "CBC" && $("#hashCheck").is(":checked") == false){
			$('#ivCheck').prop('disabled', false);
		}
	});
	
	$("#hashCheck").click(function(event) {
		if ($("#hashCheck").is(":checked") == true) {
			$('#hash_salt').prop('readonly', false);
			$("#hash_check").val("Y");
			
 			//체크박스 체크불가
			$('#ivCheck').prop('disabled', true);
			
			//체크박스 선택해제
			$("input[id=ivCheck]:checkbox").prop("checked", false);
			
			//text value값 초기화
			$("#iv_value").val("");
			
			//text value readonly true
			$('#iv_value').prop('readonly', true);
			
		}else if ($("#hashCheck").is(":checked") == false) {
			$('#hash_salt').prop('readonly', true);
			$("#hash_check").val("N");
			
			$('#ivCheck').prop('disabled', false);
			
			//text value값 초기화
			$("#hash_salt").val("");
			
			//ECB 모드에서 iv 사용불가 코드
			if($("#operate_mode option:selected").val() == "ECB"){
				//체크박스 체크불가
				$('#ivCheck').prop('disabled', true);
				//체크박스 선택해제
				$("input[id=ivCheck]:checkbox").prop("checked", false);
				//text value값 초기화
				$("#iv_value").val("");
				//text value readonly true
				$('#iv_value').prop('readonly', true);
			}else if($("#operate_mode option:selected").val() == "CBC" && $("#hashCheck").is(":checked") == false){
				$('#ivCheck').prop('disabled', false);
			}
		}
	});
	$("#ivCheck").click(function(event) {
		if ($("#ivCheck").is(":checked") == true) {
			$('#iv_value').prop('readonly', false);
			$("#iv_check").val("Y");
		}else if ($("#ivCheck").is(":checked") == false) {
			$('#iv_value').prop('readonly', true);
			$("#iv_check").val("N");
			
			//text value값 초기화
			$("#iv_value").val("");
		}
	});
	
	$("#dataEncrypt").click(function(event) {
		
		if ($("#hashCheck").is(":checked") == true) {
			if ($('#hash_salt').val().replace(/\s/g,"").length == 0) {
				alert('salt값을  확인하세요'); 
				return false; 
			}else{
				SHA();
			}
		}else if ($("#ivCheck").is(":checked") == true) {
			if ($('#iv_value').val().replace(/\s/g,"").length == 0) {
				alert('iv값을  확인하세요'); 
				return false; 
			}else{
				dataEncrypt();
			}
		}else if ($("#ivCheck").is(":checked") == false && $("#hashCheck").is(":checked") == false ) {
			dataEncrypt();
		}
	});
	
	$("#dataDecrypt").click(function(event) {
		
		dataDecrypt();
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
<!-- 					<input type="hidden" id="encryptionData" name="encryptionData" value="" /> -->
						<table class="table table-hover table-condensed">
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th class="al"> 알고리즘</th>
									<td>
<!-- 									<input type="text" readonly="readonly"/> -->
									<select class="ml10" name="algorithm" id="algorithm">
						
										<option value="AES">AES</option>
										<option value="SEED">SEED</option>
										
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> 암호화모드</th>
									<td>
<!-- 									<input type="text" readonly="readonly"/> -->
									<select class="ml10" name="operate_mode" id="operate_mode">
						
										<option value="ECB">ECB</option>
										<option value="CBC">CBC</option>
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> 일방향 알고리즘 여부</th>
									<td>
<!-- 									<input type="text"  readonly="readonly"/> -->
									
									<input type="checkbox" id="hashCheck"/>
									<input type="hidden" id="hash_check" name="hash_check" value="N"/>
									</td>
								</tr>
								<tr>
									<th class="al"> 일방향 알고리즘 SALT</th>
									<td><input type="text"  id="hash_salt" name="hash_salt" readonly="readonly"/></td>
								</tr>
								<tr>
									<th class="al"> Iv 사용여부</th>
									<td>
<!-- 									<input type="text"  readonly="readonly"/> -->
									
									<input type="checkbox" id="ivCheck"/>
									<input type="hidden" id="iv_check" name="iv_check" value="N"/>
									</td>
								</tr>
								<tr>
									<th class="al"> Iv</th>
									<td><input type="text"  id="iv_value" name="iv_value" readonly="readonly" /></td>
								</tr>
								<tr>
									<th class="al"> 암복호화할 data</th>
									<td><input type="text"  name="data" value="dataValue" /></td>
								</tr>
								<tr>
									<th class="al"> key</th>
									<td><input type="text"  name="key" value="4E16C6003F49D894F0EF3F975F4CA18EC1AD3C94DF7FC52A1C3864F02F708017" /></td>
								</tr>
							</tbody>
						</table>
						
						<input type="button" class="btn" id="dataEncrypt" value="암호화" />&nbsp;<input type="button" class="btn" id="dataDecrypt" value="복호화" />
						
					</form>
<!-- 					<div id="encryptData"></div> -->
<!-- 					<div id="decryptData"></div> -->
					<div id="cryptData"></div>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
