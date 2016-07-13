<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.fo4s.vo.AdminVO"%>
<%
	ArrayList<AdminVO> list = (ArrayList) request.getAttribute("list");
%>
<script>

function adminDelete(admin_id){
	if (confirm("삭제 하시겠습니까?")) {
		$("#deleteID").val(admin_id);
		deleteform.submit();
	}
}
function adminModify(admin_id){
	
	$("#modifyID").val(admin_id);
	modifyform.submit();
}

</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>관리자 목록</H3>
					<table class="table table-striped table-bordered table-hover table-condensed">
						<colgroup>
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						</colgroup>
						<thead>
							<tr class="success">
								<th>관리자 아이디</th>
<!-- 								<th>관리자 비밀번호</th> -->
								<th>관리자 이름</th>
								<th>관리자 권한</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<%for (int i = 0; i < list.size(); i++) {AdminVO adminVO = (AdminVO) list.get(i);%>
						
							<tr class="ac">
								<td><%=adminVO.getAdmin_id() %></td>
<%-- 								<td><%=adminVO.getPassword() %></td> --%>
								<td><%=adminVO.getName() %></td>
								<td>
								<%if( adminVO.getPermission()!= null && adminVO.getPermission().equals("S")){%>
									보안관리자
								<%} else {%>일반<%} %>
								</td>
								<td><input type="button" value="수정" id="modify" onclick="javascript:adminModify('<%=adminVO.getAdmin_id()%>')" ></td>
								<td>
								<%if( adminVO.getPermission()!= null && adminVO.getPermission().equals("N")){%>
									<input type="button" value="삭제" id="delete" onclick="javascript:adminDelete('<%=adminVO.getAdmin_id()%>')" >
								<%}%>
								</td>
							</tr>
							
						<%}%>		
						</tbody>
					</table>
					<form action="./adminModifyPage.do" method="post" name="modifyform">
						<input type="hidden" id="modifyID" name="admin_id">
					</form>
					
					<form  action="./adminDelete.do" method="post" name="deleteform">
						<input type="hidden" id="deleteID" name="admin_id">
					</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
