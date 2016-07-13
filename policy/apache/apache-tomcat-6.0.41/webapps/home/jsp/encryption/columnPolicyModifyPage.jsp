<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="kr.co.jimant.home.encryption.PolicyVO"%>
<%
	PolicyVO policyVO = (PolicyVO) request.getAttribute("policyvo");
%>
<script>
var saltSafety = 0;
var ivSafety = 0;

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

function modify() {

    $.ajax({
        type : "post",
        url : "<c:url value='/columnPolicyModify.aj'/>",
        dataType : "html",
        data : $("#columnPolicyform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("success");
            } 
        },
        error : function(xhr, textStatus) {
        	alert($("#columnPolicyform").serialize());
            
        }
    });
}

$(document).ready(function(){
	
	<%if(policyVO.getHash_check()!=null){ %>
		//체크박스 선택
		$("input[id=hashCheck]:checkbox").prop("checked", true);
		// readonly 해제
		$('#hash_salt').prop('readonly', false);
		
		//체크박스 체크불가
		$('#ivCheck').prop('disabled', true);
		$('#partialEncryptCheck').prop('disabled', true);
		$('#maskCheck').prop('disabled', true);
		
		$("#hashCheck").val("Y");
		$("#hash_salt").val("<%=policyVO.getHash_salt()%>");
		
	<%}else{ %>
		<%if(policyVO.getIv_check()!=null){ %>
			//체크박스 선택
			$("input[id=ivCheck]:checkbox").prop("checked", true);
			// readonly 해제
			$('#iv_value').prop('readonly', false);
			
			$("#ivCheck").val("Y");
			$("#iv_value").val("<%=policyVO.getIv_value()%>");
		<%} %>
		<%if(policyVO.getPartial_encrypt_check()!=null){ %>
			//체크박스 선택
			$("input[id=partialEncryptCheck]:checkbox").prop("checked", true);
			// readonly 해제
			$('#partial_encrypt_length').prop('readonly', false);
			
			$("#partialEncryptCheck").val("Y");
			$("#partial_encrypt_length").val("<%=policyVO.getPartial_encrypt_length()%>");
		<%} %>
		<%if(policyVO.getMask_check()!=null){ %>
			//체크박스 선택
			$("input[id=maskCheck]:checkbox").prop("checked", true);
			// readonly 해제
			$('#mask_digit').prop('readonly', false);
			$('#mask_value').prop('readonly', false);
		
			$("#maskCheck").val("Y");
			$("#mask_digit").val("<%=policyVO.getMask_digit()%>");
			$("#mask_value").val("<%=policyVO.getMask_value()%>");
		<%} %>
	<%} %>
	
	
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
			
		}else if ($("#hashCheck").is(":checked") == false) {
			$('#hash_salt').prop('readonly', true);
			$("#hash_check").val("N");
			
			$('#ivCheck').prop('disabled', false);
			$('#partialEncryptCheck').prop('disabled', false);
			$('#maskCheck').prop('disabled', false);
			
			//text value값 초기화
			$("#hash_salt").val("");
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
	$("#partialEncryptCheck").click(function(event) {
		if ($("#partialEncryptCheck").is(":checked") == true) {
			$('#partial_encrypt_length').prop('readonly', false);
			$("#partial_encrypt_check").val("Y");
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
	
	$("#modify").click(function(event) {
		if (confirm("수정 하시겠습니까?")) {
			
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
					//부분암호화 평문길이 숫자체크
					re = /[^0-9]/gi,""; //숫자만 허용
					if ($('#partial_encrypt_length').val().match(re)) { 
						alert('부분암호화 평문길이는 숫자만 가능합니다.'); 
						return false; 
					}
				}
				if ($("#maskCheck").is(":checked") == true) {
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
			
			modify();
		}
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
					<form method="post" id="columnPolicyform" name="columnPolicyform">
						<table class="table table-hover table-condensed">
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th class="al"> USER</th>
									<td>
									<input type="text" value="<%=policyVO.getUser() %>" name="user" readonly="readonly" />
									</td>
								</tr>
								<tr>
									<th class="al"> 테이블 이름</th>
									<td>
									<input type="text" value="<%=policyVO.getTable_name() %>" name="table_name" readonly="readonly" />
									</td>
								</tr>
								<tr>
									<th class="al"> 컬럼 이름</th>
									<td>
									<input type="text" value="<%=policyVO.getColumn_name() %>" name="column_name" readonly="readonly" />
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
									<td><input type="password"  id="hash_salt" name="hash_salt" readonly="readonly" value=""/><div class="" id="saltStrength"></div></td>
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
									<td><input type="password"  id="iv_value" name="iv_value" readonly="readonly" value=""/><div class="" id="ivStrength"></div></td>
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
									<td><input type="text"  id="partial_encrypt_length" name="partial_encrypt_length" value="0" onkeydown="onlyNumber();" readonly="readonly" /></td>
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
									<td><input type="text"  id="mask_digit" name="mask_digit" readonly="readonly" value=""/></td>
								</tr>
								<tr>
									<th class="al"> Mask</th>
									<td><input type="text"  id="mask_value" name="mask_value" readonly="readonly" value="" /></td>
								</tr>
								<tr>
									<th class="al"> </th>
									<td><input type="button" class="btn" id="modify" value="수정" /></td>
								</tr>
							</tbody>
						</table>
					</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
