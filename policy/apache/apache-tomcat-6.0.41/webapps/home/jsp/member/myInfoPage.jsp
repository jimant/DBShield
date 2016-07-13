<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="kr.co.jimant.home.member.MemberVO"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<script>

var blank_pattern = /^\s+|\s+$/g;	//스페이스바 공백을 검사하기 위한 변수

function modify() {
	if (confirm("변경 하시겠습니까?")) {

	 $.ajax({
	        type : "post",
	        url : "<c:url value='/myinfoModify.aj'/>",
	        dataType : "html",
	        data : $("#joinform").serialize(),
	        success : function(data) {
	            if (data == "success") {
	            	location.href = "./myPage.do";
	            }
	        },
	        error : function(xhr, textStatus) {
	//        	alert("error");
	            
	        }
	    });
	 
	} else {
	}

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
	
	<%if(memberVO.getMember_id()!=null ){%> $("#member_id").val("<%=memberVO.getMember_id()%>"); <%}%>
	
	<%if(memberVO.getName()!=null ){%> $("#name").val("<%=memberVO.getName()%>"); <%}%>
	
<%-- 	<%if(memberVO.getDivision()!=null && memberVO.getDivision().equals("N") ){%> --%>
// 		$("#division").val("N");
// 		$("#businessNumber").hide();
// 		$("#corporateNumber").hide();
<%-- 	<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("C1") ){%> --%>
// 		$("#division").val("C1");
<%-- 		$("#business_number").val("<%=memberVO.getBusiness_number()%>"); --%>
// 		$("#corporateNumber").hide();
<%-- 	<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("C2") ){%> --%>
// 		$("#division").val("C2");
<%-- 		$("#corporate_number").val("<%=memberVO.getCorporate_number()%>"); --%>
// 		$("#businessNumber").hide();
<%-- 	<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("P") ){%> --%>
// 		$("#division").val("P");
// 		$("#businessNumber").hide();
// 		$("#corporateNumber").hide();
<%-- 	<%}%> --%>
	
<%-- 	<%if(memberVO.getCompany_name()!=null ){%> $("#company_name").val("<%=memberVO.getCompany_name()%>"); <%}%> --%>
	
<%-- 	<%if(memberVO.getJob()!=null ){%> $("#job").val("<%=memberVO.getJob()%>"); <%}%> --%>
	
	<%if(memberVO.getPhone_number()!=null && !memberVO.getPhone_number().equals("") && memberVO.getPhone_number().substring(1,2).equals("2") && memberVO.getPhone_number().length() == 10){%> 
		$("#pn_1").val("<%=memberVO.getPhone_number().substring(0,2)%>"); 
		$("#pn_2").val("<%=memberVO.getPhone_number().substring(2,6)%>"); 
		$("#pn_3").val("<%=memberVO.getPhone_number().substring(6,10)%>"); 
	<%}else if(memberVO.getPhone_number()!=null && !memberVO.getPhone_number().equals("") && memberVO.getPhone_number().substring(1,2).equals("2") && memberVO.getPhone_number().length() == 9){%> 
		$("#pn_1").val("<%=memberVO.getPhone_number().substring(0,2)%>"); 
		$("#pn_2").val("<%=memberVO.getPhone_number().substring(2,5)%>"); 
		$("#pn_3").val("<%=memberVO.getPhone_number().substring(5,9)%>"); 
	<%}else if(memberVO.getPhone_number()!=null && !memberVO.getPhone_number().equals("") && memberVO.getPhone_number().length() == 11 ){%> 
		$("#pn_1").val("<%=memberVO.getPhone_number().substring(0,3)%>"); 
		$("#pn_2").val("<%=memberVO.getPhone_number().substring(3,7)%>"); 
		$("#pn_3").val("<%=memberVO.getPhone_number().substring(7,11)%>"); 
	<%}else if(memberVO.getPhone_number()!=null && !memberVO.getPhone_number().equals("") && memberVO.getPhone_number().length() == 10 ){%> 
		$("#pn_1").val("<%=memberVO.getPhone_number().substring(0,3)%>"); 
		$("#pn_2").val("<%=memberVO.getPhone_number().substring(3,6)%>"); 
		$("#pn_3").val("<%=memberVO.getPhone_number().substring(6,10)%>"); 
	<%}%>
	<%if(memberVO.getCellphone_number()!=null && !memberVO.getCellphone_number().equals("") && memberVO.getCellphone_number().length() == 11 ){%> 
		$("#cpn_1").val("<%=memberVO.getCellphone_number().substring(0,3)%>"); 
		$("#cpn_2").val("<%=memberVO.getCellphone_number().substring(3,7)%>"); 
		$("#cpn_3").val("<%=memberVO.getCellphone_number().substring(7,11)%>"); 
	<%}else if(memberVO.getCellphone_number()!=null && !memberVO.getCellphone_number().equals("") && memberVO.getCellphone_number().length() == 10 ){%> 
		$("#cpn_1").val("<%=memberVO.getCellphone_number().substring(0,3)%>"); 
		$("#cpn_2").val("<%=memberVO.getCellphone_number().substring(3,6)%>"); 
		$("#cpn_3").val("<%=memberVO.getCellphone_number().substring(6,10)%>"); 
	<%}%>
	
	<%if(memberVO.getEmail()!=null ){%> $("#email").val("<%=memberVO.getEmail()%>"); <%}%>
<%-- 	<%if(memberVO.getZip_code()!=null && !memberVO.getZip_code().equals("") ){%>  --%>
<%-- 		$("#zip_code1").val("<%=memberVO.getZip_code().substring(0,3)%>");  --%>
<%-- 		$("#zip_code2").val("<%=memberVO.getZip_code().substring(3,6)%>");  --%>
<%-- 	<%}%> --%>
<%-- 	<%if(memberVO.getAddress()!=null ){%> $("#address").val("<%=memberVO.getAddress()%>"); <%}%> --%>
<%-- 	<%if(memberVO.getAddress_detail()!=null ){%> $("#address_detail").val("<%=memberVO.getAddress_detail()%>"); <%}%> --%>
	
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
	
	$("#modifyButton").click(function(event) {
		
		var regType = /^[A-Za-z0-9+""]{4,16}$/;
		
// 		if ($("#division").val() == "C1" && document.joinform.business_number.value.replace(blank_pattern, "") == "") {
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
		
		modify();
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
								<th > 아이디</th>
								<td><input type="text" id="member_id" name="member_id" maxlength="16" readonly="readonly"/></td>
							</tr>
							<tr>
								<th > 이름</th>
								<td><input type="text" id="name" maxlength="20" readonly="readonly"/></td>
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
<!-- 								<td><input type="text" id="business_number" name="business_number" maxlength="10"  /></td> -->
<!-- 							</tr> -->
<!-- 							<tr id="corporateNumber"> -->
<!-- 								<th > 법인번호</th> -->
<!-- 								<td><input type="text" id="corporate_number" name="corporate_number" maxlength="13" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th > 회사명</th> -->
<!-- 								<td><input type="text" id="company_name" name="company_name" maxlength="64" /></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th > 직무</th> -->
<!-- 								<td> -->
<!-- 									<select  name="job" id="job" > -->
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
								<td><input type="text" id="email" name="email" readonly="readonly"/></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th >주소</th> -->
<!-- 								<td> -->
<!-- 									<input type="text" id="zip_code1" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" /> - <input type="text" id="zip_code2" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" /> -->
<!-- 									<input type="hidden" id="zip_code" name="zip_code"/> -->
<!-- 									<input type="button" class ="btn btn-primary" id="postPopup" value="우편번호" /><br></br> -->
<!-- 									<input type="text" id="address" name="address" class="max gray mt20" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}"  style="width:100%;"  /><br></br> -->
<!-- 									<input type="text" id="address_detail" name="address_detail" class="max gray mt20"  maxlength="100" style="width:100%;" /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							
							<tr>
								<th > </th>
								<td><input type="button" class="btn btn-primary " id="modifyButton" value="변경" /></td>
							</tr>
						</tbody>
					</table>
				</form>	
	</div>
</div>
<!-- //container -->
