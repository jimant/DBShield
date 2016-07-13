<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<style>
        #ch1{
            display:none;
        }

        #ch1 + label{
            display:inline-block;
            width:24px;
            height:24px;
            border:2px solid #bcbcbc;
            cursor:pointer;
        }

        #ch1:checked + label:after{
            position:relative;
            top:-3px;
            left:5px;
            content: '\2714';
            font-size:18px;
        }

		#ch2{
            display:none;
        }

        #ch2 + label{
            display:inline-block;
            width:24px;
            height:24px;
            border:2px solid #bcbcbc;
            cursor:pointer;
        }

        #ch2:checked + label:after{
            position:relative;
            top:-3px;
            left:5px;
            content: '\2714';
            font-size:18px;
        }
        #ch3{
            display:none;
        }

        #ch3 + label{
            display:inline-block;
            width:24px;
            height:24px;
            border:2px solid #bcbcbc;
            cursor:pointer;
        }

        #ch3:checked + label:after{
            position:relative;
            top:-3px;
            left:5px;
            content: '\2714';
            font-size:18px;
        }

    </style>

<script>
var availableId = false;

var passwordSafety = false;

var availableEmail = false;

var blank_pattern = /^\s+|\s+$/g;	//스페이스바 공백을 검사하기 위한 변수

function idCheck() {
	
	 $.ajax({
         type : "post",
         url : "<c:url value='/idCheck.aj'/>",
         dataType : "html",
         data : $("#joinform").serialize(),
         success : function(data) {
             if (data == "success") {
             	alert("사용 가능한 아이디 입니다.");
             	availableId = true;
             } else if (data == "fail") {
             	alert("이미 사용중인 아이디 입니다.");
             } 
         },
         error : function(xhr, textStatus) {
         	alert("error");
             
         }
     });
}

function emailCheck() {
	
	 $.ajax({
        type : "post",
        url : "<c:url value='/emailCheck.aj'/>",
        dataType : "html",
        data : $("#joinform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("사용 가능한 이메일 입니다.");
            	availableEmail = true;
            } else if (data == "fail") {
            	alert("이미 사용중인 이메일 입니다.");
            } 
        },
        error : function(xhr, textStatus) {
        	alert("error");
            
        }
	  });
}

function join() {
	
	$('#idCheck').prop('disabled', true);
	$('#emailCheck').prop('disabled', true);
	$('#postPopup').prop('disabled', true);
	$('#joinButton').prop('disabled', true);
	$('#joinButton').val("처리중..");
    $.ajax({
        type : "post",
        url : "<c:url value='/join.aj'/>",
        dataType : "html",
        data : $("#joinform").serialize(),
        success : function(data) {
            if (data == "success") {
            	$('#joinButton').val("가입");
            	alert("인증메일을 발송하였습니다. 메일인증을 하셔서 회원가입을 완료해 주시기 바랍니다.");
            	location.href = "./loginPage.do";
            } else if (data == "fail") {
            	$('#joinButton').val("가입");
             	alert("사용할 수 없는 아이디 입니다.");
             	$('#joinButton').prop('disabled', false);
             	$('#idCheck').prop('disabled', false);
            	$('#emailCheck').prop('disabled', false);
            	$('#postPopup').prop('disabled', false);
            } else if (data == "typo") {
            	$('#joinButton').val("가입");
             	alert("자동가입 방지문자가 올바르지 않습니다.");
             	Recaptcha.reload();
             	$('#joinButton').prop('disabled', false);
             	$('#idCheck').prop('disabled', false);
            	$('#emailCheck').prop('disabled', false);
            	$('#postPopup').prop('disabled', false);
            } else if (data == "certify") {
            	$('#joinButton').val("가입");
             	alert("인증메일 발송실패! 이메일을 확인해 주세요.");
             	Recaptcha.reload();
             	$('#joinButton').prop('disabled', false);
             	$('#idCheck').prop('disabled', false);
            	$('#emailCheck').prop('disabled', false);
            	$('#postPopup').prop('disabled', false);
            } 
        },
        error : function(xhr, textStatus) {
        	$('#joinButton').val("가입");
        	alert("error");
        	$('#joinButton').prop('disabled', false);
        }
    });
}

function checkBizID(bizID){  //사업자등록번호 체크
	// bizID는 숫자만 10자리로 해서 문자열로 넘긴다.
	var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
	var tmpBizID, i, chkSum=0, c2, remander;
	bizID = bizID.replace(/-/gi,'');
	 
	for (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i);
	c2 = "0" + (checkID[8] * bizID.charAt(8));
	c2 = c2.substring(c2.length - 2, c2.length);
	chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
	remander = (10 - (chkSum % 10)) % 10 ;
	 
	if (Math.floor(bizID.charAt(9)) == remander) return true ; // OK!
	return false;
}

function checkNumber(numberValue){  
	var regType = /^[0-9+]{3,4}$/;
	if (regType.test(numberValue)) { 
		return true;
	} else{
		return false;
	}
}

function checkNumber3(numberValue){  
	var regType = /^[0-9+]{4,4}$/;
	if (regType.test(numberValue)) { 
		return true;
	} else{
		return false;
	}
}

function checkEmail(emailValue){  
	var regType = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	if (regType.test(emailValue)) { 
		return true;
	} else{
		return false;
	}
}

function postPopup() {
	window.open("<c:url value='/addressPopup.aj'/>", "Address Search", "width=400,height=200,resizable=1,scrollbars=yes, location=no");
}

function addressPopupCallBack(postcd1, postcd2, addressMain) {
	//alert(json.postcd1);
    $("#zip_code1").val(postcd1);
    $("#zip_code2").val(postcd2);
    $("#address").val(addressMain);
}

$(document).ready(function(){
	
	
	$("#businessNumber").hide();

	$("#corporateNumber").hide();
	
	$("#idCheck").click(function(event) {
		
		if ($("#member_id").val().replace(blank_pattern, "") == "") {	
			$("#member_id").focus();
			alert("아이디를 입력해 주세요.");
			return false;
		}
		
		var regType = /^[A-Za-z0-9+]{4,16}$/;
		if (!regType.test(document.getElementById('member_id').value)) { 
			$("#member_id").focus();
			alert('사용할 수 없는 아이디 입니다.'); 
			return false;
		}

        $("#idCheck").hide();
        
        idCheck();
        
        $('#idCheck').show();
    });
	
	$("#emailCheck").click(function(event) {
		
		if ($("#email").val().replace(blank_pattern, "") == "") {	
			$("#email").focus();
			alert("이메일를 입력해 주세요.");
			return false;
		}
		var regType = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		if (!regType.test($("#email").val())) { 
			alert('사용할 수 없는 이메일 입니다.'); 
			return false;
		}

        $("#emailCheck").hide();
        
        emailCheck();
        
        $('#emailCheck').show();
    });
	
	$('#passwordInput, #confirmPasswordInput').on('keyup', function(e) {
		 
        if($('#passwordInput').val() == '' && $('#confirmPasswordInput').val() == '')
        {
            $('#passwordStrength').removeClass().html('');
            passwordSafety = false;
            return false;
        }
 
     	if($('#passwordInput').val() != '' && $('#confirmPasswordInput').val() != '' && $('#passwordInput').val() != $('#confirmPasswordInput').val())
    	{
    		$('#passwordStrength').removeClass().addClass('alert alert-error').html('Passwords do not match!');
    		passwordSafety = false;
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
        	$('#passwordStrength').removeClass().addClass('alert alert-error').html('Password must be 6 characters long.');
        	passwordSafety = false;
        } else if (strongRegex.test($(this).val())) {
            // If reg ex matches strong password
            $('#passwordStrength').removeClass().addClass('alert alert-success').html('Good Password!');
            passwordSafety = true;
        } else if (mediumRegex.test($(this).val())) {
            // If medium password matches the reg ex
            $('#passwordStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');
            passwordSafety = false;
        } else {
            // If password is ok
            $('#passwordStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');
            passwordSafety = false;
        }
        
        return true;
    });
	
	$("#business_number, #corporate_number, #pn_2, #pn_3, #cpn_2, #cpn_3").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		}
	});
	
	
	$("#division").click(function(event) {
		if ($("#division").val() == "N") {	
			$("#businessNumber").hide();
			$("#corporateNumber").hide();
			$("#business_number").val(null);
			$("#corporate_number").val(null);
		}
		if ($("#division").val() == "C1") {	
			$("#businessNumber").show();
			$("#corporateNumber").hide();
			$("#corporate_number").val(null);
		}
		if ($("#division").val() == "C2") {	
			$("#corporateNumber").show();
			$("#businessNumber").hide();
			$("#business_number").val(null);
		}
		if ($("#division").val() == "P") {	
			$("#businessNumber").hide();
			$("#corporateNumber").hide();
			$("#business_number").val(null);
			$("#corporate_number").val(null);
		}

    });
	
	$("#postPopup").click(function(event) {
		postPopup();
    });
	
	$("#joinButton").click(function(event) {
		
		if ($("#ch1").is(":checked") != true || $("#ch2").is(":checked") != true || $("#ch3").is(":checked") != true) {	
			alert("개인정보 수집 및 이용에 대한 안내와 개인정보취급방침 그리고 이용약관 모두 동의해주세요.");
			return false;
		} 
		
		var regType = /^[A-Za-z0-9+""]{4,16}$/;
		
		if ($("#member_id").val().replace(blank_pattern, "") == "") {	
			$("#member_id").focus();
			alert("아이디를 입력해 주세요.");
			return false;
		} else if (!regType.test(document.getElementById('member_id').value)) { 
			$("#member_id").focus();
			alert('사용할 수 없는 아이디 입니다.'); 
			return false;
		} else if(!availableId){
			alert("아이디 검사를 해주세요. ");
			document.joinform.idCheck.focus();
			return false;
		} else if(!passwordSafety){
			alert("비밀번호를 확인하세요.");
			document.joinform.password.focus();
			return false;
		} else if (document.joinform.name.value.replace(blank_pattern, "") == "") {
			alert("이름을 입력해 주세요.");
			document.joinform.name.focus();
			return false;
		} 
		
// 		else if ($("#division").val() == "C1" && document.joinform.business_number.value.replace(blank_pattern, "") == "") {
// 			alert("사업자등록번호를 입력해 주세요.");
// 			document.joinform.business_number.focus();
// 			return false;
// 		} else if ($("#division").val() == "C2" && $("#corporate_number").val().replace(blank_pattern, "") == "") {
// 			alert("법인번호를 입력해 주세요.");
// 			$("#corporate_number").focus();
// 			return false;
// 		} else if ($("#division").val() == "C1") {
// 			if(!checkBizID($("#business_number").val())){
// 				alert("사업자번호가 올바르지 않습니다.");
// 				document.joinform.business_number.focus();
// 				return false;
// 			}
// 		} else if ($("#division").val() == "C2") {
// 			if(!checkBizID($("#corporate_number").val())){
// 				alert("법인번호가 올바르지 않습니다.");
// 				$("#corporate_number").focus();
// 				return false;
// 			}
// 		} 
// 		if ($("#division").val() == "C1" || $("#division").val() == "C2" ) {
// 			if ($("#company_name").val().replace(blank_pattern, "") == "") {
// 				alert("회사이름을 입력해 주세요.");
// 				$("#company_name").focus();
// 				return false;
// 			} 
// 		}
		if ($("#pn_2").val().replace(blank_pattern, "") == "") {
			alert("전화번호를 입력해 주세요.");
			$("#pn_2").focus();
			return false;
		} else if (!checkNumber($("#pn_2").val())) {
			alert("전화번호가 올바르지 않습니다.");
			$("#pn_2").focus();
			return false;
		} else if ($("#pn_3").val().replace(blank_pattern, "") == "") {
			alert("전화번호를 입력해 주세요.");
			$("#pn_3").focus();
			return false;
		} else if (!checkNumber3($("#pn_3").val())) {
			alert("전화번호가 올바르지 않습니다.");
			$("#pn_3").focus();
			return false;
		} else if ($("#cpn_2").val().replace(blank_pattern, "") == "") {
			alert("핸드폰번호를 입력해 주세요.");
			$("#cpn_2").focus();
			return false;
		} else if (!checkNumber($("#cpn_2").val())) {
			alert("핸드폰번호가 올바르지 않습니다.");
			$("#cpn_2").focus();
			return false;
		} else if ($("#cpn_3").val().replace(blank_pattern, "") == "") {
			alert("핸드폰번호를 입력해 주세요.");
			$("#cpn_3").focus();
			return false;
		} else if (!checkNumber3($("#cpn_3").val())) {
			alert("핸드폰번호가 올바르지 않습니다.");
			$("#cpn_3").focus();
			return false;
		} else if ($("#email").val().replace(blank_pattern, "") == "") {
			alert("이메일을 입력해 주세요.");
			$("#email").focus();
			return false;
		}  else if (!checkEmail($("#email").val())) {
			alert("이메일이 올바르지 않습니다.");
			$("#email").focus();
			return false;
		}  else if(!availableEmail){
			alert("이메일 검사를 해주세요. ");
			document.joinform.eamilCheck.focus();
			return false;
		} 
// 		else if ($("#division").val() == "C1" || $("#division").val() == "C2") {
// 			if($("#zip_code1").val() == ""){
// 				alert("주소를 입력해 주세요.");
// 				$("#postPopup").focus();
// 				return false;
// 			} 
// 			if ($("#address_detail").val() == "") {
// 				alert("상세주소를 입력해 주세요.");
// 				$("#address_detail").focus();
// 				return false;
// 			}
// 		} 
	
		$("#phone_number").val($("#pn_1").val() + $("#pn_2").val() + $("#pn_3").val());
		$("#cellphone_number").val($("#cpn_1").val() + $("#cpn_2").val() + $("#cpn_3").val());
// 		$("#zip_code").val($("#zip_code1").val() + $("#zip_code2").val());
		
		join();
	});
	
	
});
</script>

<!-- container -->
 <div class="jumbotron">
	<div class="container">
				<form action="./join.aj" method="post" id="joinform" name="joinform">
					<table class="table table-hover ">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th > 개인정보 수집 및 이용에 대한 안내 &nbsp;<input id="ch1" type="checkbox"><label for="ch1"></label></th>
								<td>
								<div >
								<!-- 에디터 영역 -->
								<TEXTAREA  name="notice_content" rows="" cols=""  maxlength="10000" style="width: 60%; height: 100px;" readonly="readonly">정보통신망법 규정에 따라 <(주)지먼트테크놀로지>(‘www.fo4s.com’) 에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보의 항목
첫째, 회사는 회원가 입, 원활한 서비스의 제공 및 커뮤니티의 활성화를 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 수집하고 있습니다. 
<회원가입>
아이디, 비밀번호, 이름, 이메일 주소, 휴대용 전화번호 
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. 
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록 
2. 개인정보의 수집 및 이용 목적
회원제 서비스 제공, 개인식별, <(주)지먼트테크놀로지>(‘www.fo4s.com’)  이용약관 위반 회원에 대한 이용제한 조치, 서비스의 원활한 운영에 지장을 미치는 행위 및 서비스 부정이용 행위 제재, 가입의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴의사의 확인

3. 개인정보의 보유 및 이용기간
이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
가. 회사 내부 방침에 의한 정보보유 사유 
- 부정이용기록(부정가입, 징계기록 등의 비정상적 서비스 이용기록) 
보존 항목 : 가입인증 휴대폰 번호
보존 이유 : 부정 가입 및 이용 방지
보존 기간 : 1년
※ ‘부정이용기록’이란 부정 가입 및 운영원칙에 위배되는 게시글 작성 등으로 인해 회사로부터 이용제한 등을 당한 기록입니다.
나. 관련법령에 의한 정보보유 사유 
상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
- 계약 또는 청약철회 등에 관한 기록 
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 
보존 기간 : 5년 
- 대금결제 및 재화 등의 공급에 관한 기록 
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 
보존 기간 : 5년 
- 전자금융 거래에 관한 기록 
보존 이유 : 전자금융거래법 
보존 기간 : 5년 
- 소비자의 불만 또는 분쟁처리에 관한 기록 
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 
보존 기간 : 3년 
- 웹사이트 방문기록 
보존 이유 : 통신비밀보호법 
보존 기간 : 3개월 
								</TEXTAREA>
								</div>
							</td>
							</tr>
							<tr>
								<th > 개인정보취급방침 &nbsp;<input id="ch2" type="checkbox"><label for="ch2"></label></th>
								<td>
								<div >
								<!-- 에디터 영역 -->
								<TEXTAREA  name="notice_content" rows="" cols=""  maxlength="10000" style="width: 60%; height: 100px;" readonly="readonly">1. 개인정보의 처리 목적 <(주)지먼트테크놀로지>(‘www.fo4s.com’이하 ‘Fo4s’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등

2. 개인정보처리 위탁
① <(주)지먼트테크놀로지>('Fo4s')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
② <(주)지먼트테크놀로지>('www.fo4s.com'이하 'Fo4s')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.

3. 정보주체의 권리,의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.
① 정보주체는 <(주)지먼트테크놀로지>(Fo4s)에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
1. 개인정보 열람요구
2. 오류 등이 있을 경우 정정 요구
3. 삭제요구
4. 처리정지 요구

4. 처리하는 개인정보의 항목 작성 

① <(주)지먼트테크놀로지>(Fo4s)은(는) 다음의 개인정보 항목을 처리하고 있습니다.
1<개인정보>
아이디, 비밀번호, 이름, 이메일 주소, 휴대전화번호
5. 개인정보의 파기<(주)지먼트테크놀로지>('Fo4s')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.
-파기절차
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.
-파기기한
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.

6. 개인정보의 안전성 확보 조치 <(주)지먼트테크놀로지>('Fo4s')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
1. 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.

2. 개인정보의 암호화
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.

3. 해킹 등에 대비한 기술적 대책
<(주)지먼트테크놀로지>('Fo4s')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신•점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.

4. 개인정보에 대한 접근 제한
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.

7. 개인정보 보호책임자 작성 

① (주)지먼트테크놀로지(‘www.fo4s.com’이하 ‘Fo4s) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

▶ 개인정보 보호책임자 
성명 :백승우
연락처 :02-3144-8740, tech@jimant.co.kr, 
※ 개인정보 보호 담당부서로 연결됩니다.

② 정보주체께서는 (주)지먼트테크놀로지(‘www.fo4s.com’이하 ‘Fo4s) 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자로 문의하실 수 있습니다. (주)지먼트테크놀로지(‘www.fo4s.com’이하 ‘Fo4s) 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.

8. 개인정보 처리방침 변경 
①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.
								</TEXTAREA>
								</div>
							</td>
							</tr>
							<tr>
								<th > 이용약관 &nbsp;<input id="ch3" type="checkbox"><label for="ch3"></label></th>
								<td>
								<div >
								<!-- 에디터 영역 -->
								<TEXTAREA  name="notice_content" rows="" cols=""  maxlength="10000" style="width: 60%; height: 100px;" readonly="readonly">제 1 조 (목적 등)
1. <(주)지먼트테크놀로지>(‘www.fo4s.com’) 서비스 약관 (이하 "본 약관"이라 합니다.)은 "회원"이 ㈜지먼트테크놀로지 (이하 “서비스제공자”)에서 제공하는 정보 제공 (이하 "본 서비스")을 이용함에 있어 "회원"과 "서비스제공자"의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. 
2. "회원"이 되고자 하는 자가 "서비스제공자"가 정한 소정의 절차를 거쳐서 "동의" 단추를 누르면, 본 약관에 동의 하는 것으로 간주합니다.

제 2 조 (회원의 정의)
1. '개인회원'이라 함은 서비스제공자가 제공하는 모든 컨텐츠를 이용하고자 이용자 등록 (아이디, 비밀번호)을 한 개인을 말합니다.

제 3 조 (서비스의 제공 및 변경) 
1. "서비스제공자"는 "회원"에게 ‘www.fo4s.com’ 내 모든 무료 Contents의 자유로운 이용
2. "서비스제공자"는 그 변경될 서비스의 내용 및 제공일자를 제6조 제2항에서 정한 방법으로 이용자에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.

제 4 조 (서비스의 중단)
1. "서비스제공자"는 컴퓨터 등 정보통신 설비의 보수점검 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체 기타 "서비스제공자"가 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다. 
2. 제1항에 의한 서비스 중단의 경우에는 "서비스제공자"는 제6조 제2항에서 정한 방법으로 "회원"에게 통지합니다.  다만, "서비스제공자"가 통제할 수 없는 사유로 인한 서비스의 중단 (시스템 관리자의 고의, 중과실이 없는 디스크 장애, 시스템다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다. 

제 5 조 (회원탈퇴 및 자격상실 등) 
1. "회원"은 "서비스제공자"에 언제든지 자신의 회원등록을 말소해 줄 것 (회원탈퇴)을 요청할 수 있으며 "서비스제공자"는 위 요청을 받은 즉시 해당 "회원"의 정보말소를 위한 절차를 밟습니다.
2. "회원"이 다음 각 호의 사유에 해당하는 경우, "서비스제공자"는 "회원"의 자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다. 
 - 허위 내용을 등록한 경우 
 - 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우 
 - 서비스를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 
- 설비에 여유가 없거나 기술상 지장이 있는 경우 
- 기타 회사가 필요하다고 인정되는 경우

3. "서비스제공자"가 "회원"의 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다. 
   이 경우 회원에게 회원등록 말소 전에 이를 통지하고, 소명할 기회를 부여합니다. 

제 6 조 (회원에 대한 통지) 
1. "서비스제공자"는 "본 서비스"에 대한 공지사항을 "회원"에게 "서비스제공자"가 부여한 이메일 주소로 공지할 수 있습니다. 
2. "서비스제공자"가 불특정다수 "회원"에 대한 통지를 하는 경우 7일 이상 공지함으로써 개별 통지에 갈음할 수 있습니다. 

제 7 조 (이용자의 개인정보보호) 
1. “서비스제공자”는 "본 서비스"에 등록된 개인정보를 관리합니다.
2. "서비스제공자"는 관련법령이 정하는 바에 따라서 "회원"의 개인정보를 보호하기 위하여 노력합니다.

제 8 조 (서비스제공자의 의무)
1. "서비스제공자"는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며, 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다. 
2. "서비스제공자"는 "회원"이 안전하게 인터넷 서비스를 이용할 수 있도록 "회원"의 개인정보 (신용정보 포함)보호를 위한 보안 시스템을 구축합니다. 

3. "서비스제공자"는 "회원"이 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. 

제 9 조 (이용 해지 및 이용제한)
1. "회원"이 "본 서비스"의 이용을 해지하고자 하는 때에는 "회원" 본인이 서비스 또는 전자우편을 통하여 해지하고자 하는 날의 2일전 까지 (단, 해지일이 법정공휴일인 경우 공휴일 개시 3일전 까지) 이를 "서비스제공자"에 신청 하여야 합니다.

제 10 조 (손해배상 및 면책조항) 
1. "서비스제공자"는 "본 서비스"의 이용과 관련하여 "서비스제공자"의 고의 또는 중대한 과실 없이 "회원"에게 발생한 일체의 손해에 관하여 책임을 부담하지 않습니다.

제 11 조 (약관의 개정)
1. "서비스제공자"는 약관의 규제 등에 관한 법률을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다. 
2. "서비스제공자"가 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 
3. "회원"은 변경된 약관에 대해 거부할 권리가 있습니다. "회원"은 변경된 약관이 공지된 후 15일 이내에 거부의사를 표명할 수 있습니다. "회원"이 거부하는 경우 "서비스제공자"는 당해 "회원"과의 계약을 해지할 수 있습니다. 
   만약 "회원"이 변경된 약관이 공지된 후 15일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.

제 12 조 (재판관할) 
1. "서비스제공자"와 "회원"간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다. 

- 부칙
본 약관은 2015. 2. 1부터 적용하고, 기존의 이용자에 대해서는 본 약관으로 대체하는 것으로 합니다.
								</TEXTAREA>
								</div>
							</td>
							</tr>
							<tr>
								<th > 아이디</th>
								<td><input type="text" id="member_id" name="member_id" maxlength="16" onkeyDown="availableId = false;" />&nbsp;<input type="button" class ="btn btn-primary" id="idCheck" value="아이디 검사" /></td>
							</tr>
							<tr>
								<th > 비밀번호</th>
								<td><input type="password" id="passwordInput" name="password" maxlength="16" /><div class="" id="passwordStrength"></div></td>
							</tr>
							<tr>
								<th > 비밀번호 재입력</th>
								<td><input type="password" id="confirmPasswordInput" maxlength="16" /></td>
							</tr>
							<tr>
								<th > 이름</th>
								<td><input type="text" id="name" name="name" maxlength="20" /></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th > 유형</th> -->
<!-- 								<td> -->
<!-- 									<select  name="division" id="division"> -->
<!-- 											<option value="N">일반</option> -->
<!-- 											<option value="C1">개인기업</option> -->
<!-- 											<option value="C2">법인</option> -->
<!-- 											<option value="P">프리미엄</option> -->
<!-- 									</select> -->
<!-- 								</td> -->
								
<!-- 							</tr> -->
<!-- 							<tr id="businessNumber"> -->
<!-- 								<th > 사업자등록번호</th> -->
<!-- 								<td><input type="text" id="business_number" name="business_number" maxlength="10"/></td> -->
<!-- 							</tr> -->
<!-- 							<tr id="corporateNumber"> -->
<!-- 								<th > 법인번호</th> -->
<!-- 								<td><input type="text" id="corporate_number" name="corporate_number" maxlength="13"/></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th > 회사명</th> -->
<!-- 								<td><input type="text" id="company_name" name="company_name" maxlength="64"/></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th > 직무</th> -->
<!-- 								<td> -->
<!-- 									<select  name="job" id="job"> -->
<!-- 											<option value="1">IT</option> -->
<!-- 											<option value="2">보안</option> -->
<!-- 											<option value="3">관리</option> -->
<!-- 											<option value="4">영업</option> -->
<!-- 											<option value="5">기타</option> -->
<!-- 									</select> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<th > 전화번호</th>
								<td><select id="pn_1">
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="044">044</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
									</select> - 
									<input type="text" id="pn_2" maxlength="4" /> - <input type="text" id="pn_3" maxlength="4" />
									<input type="hidden" id="phone_number" name="phone_number"/>
								</td>
							</tr>
							<tr>
								<th > 핸드폰번호</th>
								<td><select id="cpn_1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
									</select> - 
									<input type="text" id="cpn_2" maxlength="4" /> - <input type="text" id="cpn_3" maxlength="4" />
									<input type="hidden" id="cellphone_number" name="cellphone_number"/>
								</td>
							</tr>
							<tr>
								<th > 이메일</th>
								<td><input type="text" id="email" name="email" onkeyDown="availableEmail = false;" />&nbsp;<input type="button" class ="btn btn-primary" id="emailCheck" value="이메일 검사" /></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th >주소</th> -->
<!-- 								<td> -->
<!-- 									<input type="text" id="zip_code1" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" /> - <input type="text" id="zip_code2" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" /> -->
<!-- 									<input type="hidden" id="zip_code" name="zip_code"/> -->
<!-- 									<input type="button" class ="btn btn-primary" id="postPopup" value="우편번호" /><br></br> -->
<!-- 									<input type="text" id="address" name="address" class="max gray mt20" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}"  style="width:100%;" /><br></br> -->
<!-- 									<input type="text" id="address_detail" name="address_detail" class="max gray mt20"  maxlength="100" style="width:100%;" /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<th > 자동가입 방지문자</th>
								<td>
									<%
										ReCaptcha c = ReCaptchaFactory.newReCaptcha(
									       		  	"6LdlHOsSAAAAAM8ypy8W2KXvgMtY2dFsiQT3HVq-", 
									        		"6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY", false);
										out.print(c.createRecaptchaHtml(null, null));
									%>
								</td>
							</tr>	
							<tr>
								<th > </th>
								<td><input type="button" class="btn btn-primary " id="joinButton" value="가입" /></td>
							</tr>
						</tbody>
					</table>
				</form>	
	</div>
</div>
<!-- //container -->
