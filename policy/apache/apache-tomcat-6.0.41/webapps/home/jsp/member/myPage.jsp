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
function infoModify() {
	
	location.href = "./myInfoPage.do";
}

function passModify() {
	
	location.href = "./passModifyPage.do";
}

function withdrawal() {
	
	location.href = "./withdrawalPage.do";
}


$(document).ready(function(){

	$("#infoModify").click(function(event) {
		infoModify()
	});
	
	$("#passModify").click(function(event) {
		passModify()
	});
	
	$("#withdrawal").click(function(event) {
		withdrawal()
	});
});
</script>

<!-- container -->
 <div class="jumbotron">
	<div class="container">
	  <h2>마이페이지</h2>
	  <table class="table  table-hover ">
			<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th > 아이디</th>
								<td><%=memberVO.getMember_id() %></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><%=memberVO.getName() %></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th>유형</th> -->
<!-- 								<td> -->
<%-- 									<%if(memberVO.getDivision()!=null && memberVO.getDivision().equals("N") ){%>일반 --%>
<%-- 									<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("C1") ){%>개인사업자 --%>
<%-- 									<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("C2") ){%>법인 --%>
<%-- 									<%}else if(memberVO.getDivision()!=null && memberVO.getDivision().equals("P") ){%>프리미엄 --%>
<%-- 									<%}%> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th>직무</th> -->
<!-- 								<td> -->
<%-- 									<%if(memberVO.getJob()!=null && memberVO.getJob().equals("1") ){%>IT --%>
<%-- 									<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("2") ){%>영업 --%>
<%-- 									<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("3") ){%>보안 --%>
<%-- 									<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("4") ){%>관리 --%>
<%-- 									<%}else if(memberVO.getJob()!=null && memberVO.getJob().equals("5") ){%>기타 --%>
<%-- 									<%}%> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<th>전화번호</th>
								<td><%=memberVO.getPhone_number() %></td>
							</tr>
							<tr>
								<th>핸드폰번호</th>
								<td><%=memberVO.getCellphone_number() %></td>
							</tr>
							<tr>
								<th>email</th>
								<td><%=memberVO.getEmail() %></td>
							</tr>
							<tr>
								<th></th>
								<td>
								<input type="button" class="btn  " id="infoModify" value="정보변경" />
								<input type="button" class="btn  " id="passModify" value="비밀번호변경" />
								<input type="button" class="btn  " id="withdrawal" value="회원탈퇴" />
								</td>
							</tr>
				
			</tbody>
		</table>

    </div>
</div>

<!-- //container -->
