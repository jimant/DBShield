<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.fo4s.vo.ConnectionVO"%>
<%@ page import="kr.co.jimant.fo4s.vo.PolicyVO"%>
<%
	ArrayList<String> list = (ArrayList) request.getAttribute("list");

	ConnectionVO connectionVO = (ConnectionVO) request.getAttribute("connectionVO");
	
	PolicyVO policyVO = (PolicyVO) request.getAttribute("policyVO");
	
%>
<script>
var saltSafety = 0;
var ivSafety = 0;

function columnView() {
	 
    $.ajax({
        type : "post",
        url : "<c:url value='/columnView.aj'/>",
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
//         	alert("error");
            
        }
    });
}

function tableView() {
	 
    $.ajax({
        type : "post",
        url : "<c:url value='/tableView.aj'/>",
        dataType : "html",
        data : $("#sendform").serialize(),
        success : function(response) {
        	var data = jQuery.parseJSON(response);
        	var str = "";
        	
        	for (var i = 0; i < data.result.length; i++) {
        		
        			str += "<option value='" + data.result[i].tableName + "' >" + data.result[i].tableName + "</option>";
        	}
        	$("#selectTable").html(str);
        	
        	columnView();
			
        },
        error : function(xhr, textStatus) {
        	alert("error");
            
        }
    });
}

function register() {

    $.ajax({
        type : "post",
        url : "<c:url value='/columnPolicy.aj'/>",
        dataType : "html",
        data : $("#columnPolicyform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("등록완료");
            	document.location.reload();
            } 
            if (data == "already") {
            	alert("동일Table 동일Column 암호정책이 이미존재합니다.");
            } 
        },
        error : function(xhr, textStatus) {
        	alert($("#columnPolicyform").serialize());
            
        }
    });
}

$(document).ready(function(){
	
	<%if(policyVO.getOperate_mode()!=null && policyVO.getOperate_mode().equals("ECB")){%>
		$("#IV_CHECK_USE").hide();
		$("#IV_VALUE_USE").hide();
	<%}%>
	
	$("#partial_encrypt_length ").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		}
	});
	
	tableView();
	
	$("#selectDB").change(function() {
		tableView();
	});
	
	$("#selectTable").change(function() {
		columnView();
	});
	
	$("#hashCheck").click(function(event) {
		if ($("#hashCheck").is(":checked") == true) {
			$('#hash_salt').prop('readonly', false);
			$("#hash_check").val("Y");
			
 			//체크박스 체크불가
			$('#ivCheck').prop('disabled', true);
			$('#partialEncryptCheck').prop('disabled', true);
			$('#maskCheck').prop('disabled', true);
			
			//체크박스 선택해제
			$("input[id=ivCheck]:checkbox").prop("checked", false);
			$("input[id=partialEncryptCheck]:checkbox").prop("checked", false);
			$("input[id=maskCheck]:checkbox").prop("checked", false);
			
			//text value값 초기화
			$("#iv_value").val("");
			$("#partial_encrypt_length").val("0");
			$("#mask_digit").val("");
			$("#mask_value").val("");
			
			//text value readonly true
			$('#iv_value').prop('readonly', true);
			$('#partial_encrypt_length').prop('readonly', true);
			$('#mask_digit').prop('readonly', true);
			$('#mask_value').prop('readonly', true);
			
			$('#saltStrength').removeClass().html('');
	        saltSafety = 0;
		}else if ($("#hashCheck").is(":checked") == false) {
			$('#hash_salt').prop('readonly', true);
			$("#hash_check").val("N");
			
			$('#ivCheck').prop('disabled', false);
			$('#partialEncryptCheck').prop('disabled', false);
			$('#maskCheck').prop('disabled', false);
			
			//text value값 초기화
			$("#hash_salt").val("");
			
			$('#saltStrength').removeClass().html('');
	        saltSafety = 0;
		}
	});
	$("#ivCheck").click(function(event) {
		if ($("#ivCheck").is(":checked") == true) {
			$('#iv_value').prop('readonly', false);
			$("#iv_check").val("Y");
			
			$('#ivStrength').removeClass().html('');
			ivSafety = 0;
		}else if ($("#ivCheck").is(":checked") == false) {
			$('#iv_value').prop('readonly', true);
			$("#iv_check").val("N");
			
			//text value값 초기화
			$("#iv_value").val("");
			
			$('#ivStrength').removeClass().html('');
			ivSafety = 0;
		}
	});
	$("#partialEncryptCheck").click(function(event) {
		if ($("#partialEncryptCheck").is(":checked") == true) {
			$('#partial_encrypt_length').prop('readonly', false);
			$("#partial_encrypt_check").val("Y");
			
			$("#partial_encrypt_length").val("");
		}else if ($("#partialEncryptCheck").is(":checked") == false) {
			$('#partial_encrypt_length').prop('readonly', true);
			$("#partial_encrypt_check").val("N");
			
			//text value값 초기화
			$("#partial_encrypt_length").val("0");
		}
	});
	$("#maskCheck").click(function(event) {
		if ($("#maskCheck").is(":checked") == true) {
			$('#mask_digit').prop('readonly', false);
			$('#mask_value').prop('readonly', false);
			$("#mask_check").val("Y");
		}else if ($("#maskCheck").is(":checked") == false) {
			$('#mask_digit').prop('readonly', true);
			$('#mask_value').prop('readonly', true);
			$("#mask_check").val("N");
			
			//text value값 초기화
			$("#mask_digit").val("");
			$("#mask_value").val("");
		}
	});
	
	$("#register").click(function(event) {
		
		var selectDB = $("#selectDB option:selected").val();
		var selectTable = $("#selectTable option:selected").val();
		var selectColumn = $("#selectColumn option:selected").val();
		$("#db_name").val(selectDB);
		$("#table_name").val(selectTable);
		$("#column_name").val(selectColumn);
		
		if ($("#hashCheck").is(":checked") == true) {
			if (saltSafety!=1) {
				alert('salt값을  확인하세요'); 
				return false; 
			}
		}else{
			if ($("#ivCheck").is(":checked") == true) {
				if (ivSafety!=1) {
					alert('iv값을  확인하세요'); 
					return false; 
				}
			}
			if ($("#partialEncryptCheck").is(":checked") == true) {
				if ($('#partial_encrypt_length').val() == "") { 
					alert('부분암호화 평문길이를 입력하세요'); 
					return false; 
				}
				//부분암호화 평문길이 숫자체크
				re = /[^0-9]/gi,""; //숫자만 허용
				if ($('#partial_encrypt_length').val().match(re)) { 
					alert('부분암호화 평문길이는 숫자만 가능합니다.'); 
					return false; 
				}
			}
			if ($("#maskCheck").is(":checked") == true) {
				if ($('#mask_digit').val() == "") { 
					alert('Masking 자리수를 입력하세요'); 
					return false; 
				}
				if ($('#mask_value').val() == "") { 
					alert('Mask를 입력하세요'); 
					return false; 
				}
				re =  /[^0-9\,\.]/; // , . 숫자 만허용
				if ($('#mask_digit').val().match(re)) { 
					alert('Masking 자리수가 형식에 맞지않습니다.'); 
					return false; 
				}
				re =  /[^#\*]/; //# * 만 허용
				if ($('#mask_value').val().match(re)) { 
					alert('mask는 #과 *중 한문자만 입력가능합니다.'); 
					return false; 
				}
			}
		}
		
		register();
	});
	
	$('#hash_salt').on('keyup', function(e) {
		 
	       if($('#hash_salt').val() == '' ){
	           $('#saltStrength').removeClass().html('');
	           saltSafety = 0;
	           return false;
	       }
	       // Must have capital letter, numbers and lowercase letters
	       var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
	       // Must have either capitals and lowercase letters or lowercase and numbers
	       var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
	       // Must be at least 6 characters long
	       var okRegex = new RegExp("(?=.{6,}).*", "g");
	       
	       if (okRegex.test($(this).val()) === false) {
	           // If ok regex doesn't match the password
	       	$('#saltStrength').removeClass().addClass('alert alert-error').html('Password must be 6 characters long.');
	       	saltSafety = 0;
	       } else if (strongRegex.test($(this).val())) {
	           // If reg ex matches strong password
	           $('#saltStrength').removeClass().addClass('alert alert-success').html('Good Password!');
	           saltSafety = 1;
	       } else if (mediumRegex.test($(this).val())) {
	           // If medium password matches the reg ex
	           $('#saltStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');
	           saltSafety = 0;
	       } else {
	           // If password is ok
	           $('#saltStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');
	           saltSafety = 0;
	       }
	       
	       return true;
	   });
	$('#iv_value').on('keyup', function(e) {
		 
	       if( $('#iv_value').val() == ''){
	           $('#ivStrength').removeClass().html('');
	           saltSafety = 0;
	           return false;
	       }
	       // Must have capital letter, numbers and lowercase letters
	       var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
	       // Must have either capitals and lowercase letters or lowercase and numbers
	       var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
	       // Must be at least 6 characters long
	       var okRegex = new RegExp("(?=.{6,}).*", "g");
	       
	       if (okRegex.test($(this).val()) === false) {
	           // If ok regex doesn't match the password
	       	$('#ivStrength').removeClass().addClass('alert alert-error').html('Password must be 6 characters long.');
	       	ivSafety = 0;
	       } else if (strongRegex.test($(this).val())) {
	           // If reg ex matches strong password
	           $('#ivStrength').removeClass().addClass('alert alert-success').html('Good Password!');
	           ivSafety = 1;
	       } else if (mediumRegex.test($(this).val())) {
	           // If medium password matches the reg ex
	           $('#ivStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');
	           ivSafety = 0;
	       } else {
	           // If password is ok
	           $('#ivStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');
	           ivSafety = 0;
	       }
	       
	       return true;
	   });
	
});
</script>
<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>컬럼별 암호정책 설정</H3>
					<form method="post" id="sendform" name="sendform">
					<input type="hidden" name="db_type" value="<%=connectionVO.getDb_type() %>" />
					<input type="hidden" name="host" value="<%=connectionVO.getHost() %>" />
					<input type="hidden" name="user" value="<%=connectionVO.getUser() %>" />
					<input type="hidden" name="password" value="<%=connectionVO.getPassword() %>" />
					<input type="hidden" name="port" value="<%=connectionVO.getPort() %>" />
						<table class="table table-hover table-condensed">
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th class="al"> USER</th>
									<td>
									<input type="text" value="<%=connectionVO.getUser() %>" readonly="readonly" />
									</td>
								</tr>
								<tr>
									<th class="al"> DB 이름</th>
									<td>
<!-- 									<input type="text" /> -->
									<select class="ml10" id="selectDB" name="db_name">
								<%for (int i = 0; i < list.size(); i++) {String dbName = (String) list.get(i);%>
									<option value="<%=dbName %>"><%=dbName %></option>
								<%}%>
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> 테이블 이름</th>
									<td>
<!-- 									<input type="text"  /> -->
									<select class="ml10" id="selectTable" name="table_name">
						
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
									</select>
<!-- 									<input type="button" id="dataView" value="조회" style="vertical-align: 20%"/> -->
									</td>
								</tr>
								<tr>
									<th class="al"> 컬럼 이름</th>
									<td>
<!-- 									<input type="text"  /> -->
									<select class="ml10" id="selectColumn" name="column_name">
						
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
									</select>
<!-- 									<input type="button" id="dataView" value="조회" style="vertical-align: 20%"/> -->
									</td>
								</tr>
								</tbody>
						</table>
					</form>
					<form method="post" id="columnPolicyform" name="columnPolicyform">
					<input type="hidden" name="user" value="<%=connectionVO.getUser() %>" />
					<input type="hidden" id = "table_name" name="table_name" value="" />
					<input type="hidden" id = "column_name" name="column_name" value="" />
								
						<table class="table table-condensed">
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>	
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
									<td><input type="password"  id="hash_salt" name="hash_salt" readonly="readonly" maxlength="16"/>&nbsp;1개이상의 대문자,숫자,특수문자포함 8자이상<div class="" id="saltStrength"></div></td>
								</tr>
								<tr id="IV_CHECK_USE">
									<th class="al"> Iv 사용여부</th>
									<td>
<!-- 									<input type="text"  readonly="readonly"/> -->
									
									<input type="checkbox" id="ivCheck"/>
									<input type="hidden" id="iv_check" name="iv_check" value="N"/>
									</td>
								</tr>
								<tr id="IV_VALUE_USE">
									<th class="al"> Iv</th>
									<td><input type="password"  id="iv_value" name="iv_value" readonly="readonly" maxlength="16"/>&nbsp;1개이상의 대문자,숫자,특수문자포함 8자이상<div class="" id="ivStrength"></div></td>
								</tr>
								<tr>
									<th class="al"> 부분암호화 여부</th>
									<td>
<!-- 									<input type="text"  readonly="readonly"/> -->
									
									<input type="checkbox" id="partialEncryptCheck"/>
									<input type="hidden" id="partial_encrypt_check" name="partial_encrypt_check" value="N"/>
									</td>
								</tr>
								<tr>
									<th class="al"> 부분암호화 평문길이</th>
									<td><input type="text"  id="partial_encrypt_length" name="partial_encrypt_length" value="0" readonly="readonly" maxlength="2"/> &nbsp;숫자 입력</td>
								</tr>
								<tr>
									<th class="al"> Masking 여부</th>
									<td>
<!-- 									<input type="text" readonly="readonly"/> -->
									
									<input type="checkbox" id="maskCheck"/>
									<input type="hidden" id="mask_check" name="mask_check" value="N"/>
									</td>
								</tr>
								<tr>
									<th class="al"> Masking 자리수</th>
									<td><input type="text"  id="mask_digit" name="mask_digit" readonly="readonly" maxlength="16"/> &nbsp;ex) 1,5.8,12</td>
								</tr>
								<tr>
									<th class="al"> Mask</th>
									<td><input type="text"  id="mask_value" name="mask_value" readonly="readonly" maxlength="1"/> &nbsp;ex) # 또는 * 입력</td>
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
