<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.jimant.home.encryption.AccessControlVO"%>
<%
	ArrayList<AccessControlVO> list = (ArrayList) request.getAttribute("list");

	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>
<script>
function checkboxDelete(){
	obj = document.getElementsByName("c1");
	
	var i = 0;
	var msg="";
	while( obj[i] ) {
		// checkbox 는 같은 Deepth상에 존재하는 이름은 같으나 Value가 다른 Node이다 . 즉 , 배열이라는 소리 ^^;
		// 총 5개이므로 5번 Loop를 수행한 후 obj[5]부터는 존재하지 않기에 Loop를 탈출한다. <-- 배열 index는 0부터죠?
		if(obj[i].checked == true ){
			msg+=obj[i].value+"/"; // '/'는 구분 문자열로 차후 spilt해서 사용을 할 수 있다.
		}
		i++;
	}
	location.href = "./behaviorCheckDelete.do?msg="+msg;
}
$(document).ready(function(){
	
	$("#delete").click(function(event) {
		checkboxDelete();			
	});
});

</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
					<table class="table table-striped table-bordered table-hover table-condensed">
						<colgroup>
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>접속 IP</th>
								<th>DB USER</th>
								<th>짧은 시간</th>
								<th>짧은 시간 횟수</th>
								<th>긴 시간</th>
								<th>긴 시간 횟수</th>
							</tr>
						</thead>
						<tbody>
						<%for (int i = 0; i < list.size(); i++) {AccessControlVO accessControlVO = (AccessControlVO) list.get(i);%>
						
							<tr class="ac">
								<td><input type="checkbox" name="c1" value="<%=accessControlVO.getBehavior_access_control_id()%>"></td>
								<td><%=accessControlVO.getConnect_ip() %></td>
								<td><%=accessControlVO.getConnect_db_user() %></td>
								<td><%=accessControlVO.getSmall_time() %></td>
								<td><%=accessControlVO.getSmall_time_count() %></td>
								<td><%=accessControlVO.getBig_time() %></td>
								<td><%=accessControlVO.getBig_time_count() %></td>
							</tr>
							
						<%}%>		
						</tbody>
					</table>
					<input type="button"  class="btn" id="delete" value="삭제" />
					<ul class="pager">
								<%if (nowpage <= 1) {%>
								<li><a>Previous</a></li> &nbsp;
								<%} else {%>
								<li><a href="./behaviorACViewPage.do?page=<%=nowpage - 1%>">Previous</a></li>&nbsp;
								<%}%>
								<%for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {%>
								<%=a%>
								<%} else {%>
								<a href="./behaviorACViewPage.do?page=<%=a%>"><%=a%> </a>
								<%}%>
								<%}%>
								<%if (nowpage >= maxpage) {%>
								<li><a>Next</a></li>
								<%} else {%>
								<li><a href="./behaviorACViewPage.do?page=<%=nowpage + 1%>">Next</a></li>
								<%}%>
					</ul>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
